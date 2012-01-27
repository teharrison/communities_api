#!/usr/bin/perl

package Genomics::Dispatcher;

use strict;
use warnings;

use JSON;
use Data::Dumper;
use LWP::UserAgent;
use HTTP::Request;
use File::Temp;

use Genomics;
use GenomicsUtils;

sub new {
    my ($class) = @_;

    my $self = { };
    my $dbh = GenomicsUtils::connect('localhost');
    $self->{'dbh'}=$dbh;
    return bless $self, $class;
}

sub decorateIsolateTreeByMg
{
my $self=shift;
my $params=shift;

my $json=new JSON;

my $isolateSeqs=$self->getDomainSeqs($params);
my $isoTemplate='/tmp/'.$params->{'protFamName'}.'.XXXXXX';
my $isoFh=new File::Temp (TEMPLATE=>$isoTemplate,SUFFIX=>'.faa');
print $isoFh $isolateSeqs;
close $isoFh;
my $mgJson=$self->getMgSeqs($params);
my $mgSeqs=$json->decode($mgJson);
my $mgSeqId=1;

# format $mgSeqs as fasta
my $mgTemplate='/tmp/'.$params->{'mgId'}.'.XXXXXX';
my $mgFh=new File::Temp (TEMPLATE=>$mgTemplate,SUFFIX=>'.faa');
foreach my $seq (@{$mgSeqs->{$params->{'protFamName'}}})
{
	print $mgFh ">MG$mgSeqId\n$seq\n";
	++$mgSeqId;
}
close $mgFh;
my $uclustTemplate='/tmp/'.$params->{'protFamName'}.$params->{'mgId'}.'.XXXXXX';
my $uclustFh=new File::Temp (TEMPLATE=>$mgTemplate,SUFFIX=>'.uc');
close $uclustFh;
# run uclust
my $uclustProc=`/usr2/people/kkeller/kbase/comm/cogget/uclust1.1.579q_i86linux64 --quiet --amino --libonly --id 0.70 --input $mgFh --lib $isoFh --uc $uclustFh`;

my $uclustOut=`cat $uclustFh`;

my $isolateTree=$self->getTree($params);

return $uclustOut;
return $isolateSeqs.
	"\n==\n".
	$mgSeqs.
	"\n==\n".
	$isolateTree.
	"\n==\n".
	$isoFh. ' ' . $mgFh. $uclustFh.
	"\n==\n".
	$uclustOut.
	"\n==\n"
	;
}

sub getDomainSeqs {
    my $self=shift;
    my $params=shift;

    my $protFamName=$params->{'protFamName'};
    $protFamName = formatProtFamName ($protFamName);

    # cheap hack to munge COGxxxx to xxxx
    $protFamName=~s/COG//;

    my $seqTable='AASeq';
#	$seqTable='LocusSeq';
    my $seqQuery = qq{
	SELECT s.taxonomyId,l.locusId,l.version,seq.sequence
       	FROM Scaffold s
	JOIN Locus l USING (scaffoldId)
	JOIN COG c USING (locusId,version)
	JOIN $seqTable seq USING (locusId,version)
	WHERE c.cogInfoId=?
	AND l.priority=1 AND s.isActive=1
	ORDER BY length(seq.sequence) DESC, locusId
    };
#			    . " $taxSpec");

    my $results = GenomicsUtils::query($seqQuery,$protFamName);

	my $returnSeq;
	foreach (@$results) {
	    my ($tax,$locus,$version,$seq) = @$_;
	    $returnSeq.=GenomicsUtils::formatFASTA("${locus}_$version",$seq);
	}

	return $returnSeq;
}


sub getTree {

    my $self=shift;
    my $json = new JSON;
    my $params=shift;
    my $protFamName = $params->{'protFamName'};

#    $debug = $cgi->param('debug') || 0;
#    GenomicsUtils::setDebug($debug) if $debug;
#    Browser::DB::dbSetDebug($debug) if $debug;

#    Browser::DB::dbConnect();

    unless (defined $protFamName) {
	fail("No protFamName provided");
    }

    # protFamName formats (type: name)
    # COG: COG1
    # PFAM: PF00001
    # TIGRFAMs: TIGR00001
    # 16S: 16S, 23S: 23S, 5S: 5S
    # Adhoc: Adhoc10006076.1
    # GENE3D: 2h7iA00, 2hbwA01, 2hbwA02
    # PIRSF: PIRSF000006
    # SMART: SM00004
    # SSF: SSFmodel0053616
    # species: Set1, BacterialTree, Bork, FastTreeCombined, GuideTree, MOSpeciesTree

    $protFamName = formatProtFamName ($protFamName);

    my $tree_query = qq{ SELECT newick FROM Tree where name = '$protFamName' };
    my $newick = queryScalar($tree_query);
    fail("Database error while finding tree for $protFamName") if !defined $newick;
    #warn "Loaded tree\n" if $debug;

    # DEBUG
    #print "Content-type: text/plain\n\n";
    #print "'$tree_query'\n";
    #print $newick."\n";

    my $data = { 'protFamName' => $protFamName,
	         'newick' => $newick 
	       }; 
    return $json->encode ($data);

}

sub getMgSeqs {

my $self=shift;
my $params=shift;

my $protFamName=$params->{'protFamName'};
my $mgId=$params->{'mgId'};
return undef unless ($protFamName and $mgId);

my $url="http://api.metagenomics.anl.gov/sequences/$mgId/?type=ontology&seq=protein&function=$protFamName&source=COG";

my $ua = LWP::UserAgent->new;
$ua->timeout(10);

my $response=$ua->get($url);
return $response->content if ($response->is_success);


}

sub formatProtFamName {
    my $protFamName = shift;
    my $protFamNum = 0;
    if ($protFamName =~ /^CO?G?\.?(\d+)/) {
	$protFamNum = $1;
	$protFamNum =~ s/^0+//;
	$protFamName = 'COG'.$protFamNum;
    }
    elsif ($protFamName =~ /^PFA?M?\.?(\d+)/) {
	$protFamNum = $1;
	$protFamNum =~ s/^0+//;
	$protFamNum = '0'x(length($protFamNum)-5).$protFamNum;
	$protFamName = 'PFAM'.$protFamNum;
    }
    elsif ($protFamName =~ /^TI?G?R?F?A?M?\.?(\d+)/) {
	$protFamNum = $1;
	$protFamNum =~ s/^0+//;
	$protFamNum = '0'x(length($protFamNum)-5).$protFamNum;
	$protFamName = 'TIGR'.$protFamNum;
    }
    return $protFamName;
}

sub fail($) {
    my ($notice) = @_;
    print "Content-type: text/html\n\n"; # MIME-type
    print "<HTML>\n";
    print $notice."\n";
    Browser::DB::dbDisconnect();
#    print STDERR "Failing: $notice\n" if $debug;
    exit;
}

sub addWarning($) {
    my ($warning) = @_;
#    $warningsHTML .= $warning;
#    $warningsHTML .= "<BR>";
    return();
}


1;
