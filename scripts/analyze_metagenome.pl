#!/kb/runtime/bin/perl

#Script for submitting metagenome to AWE
#Command name: analyze_metagenome.pl
#Parameters:
#     -metagenome_name=<metagenome/file name for sequence file in datastore, must match any metagenome name in metadata file, required>
#     -metagenome_datastore_id=<sequence/read file ID in datastore, required>
#     -metadata_datastore_id=<metadata file ID in datastore, required>
#     -conf=<configuration file, (default='awe.ini')>

use strict;
use warnings;
no warnings('once');

use Config::Simple;
use JSON;
use File::Slurp;
use Getopt::Long;
use LWP::UserAgent;
use MIME::Base64;
use Data::Dumper;
umask 000;

# parameters
my %vars = ();
$vars{jobname} = "";
$vars{shocknode} = "";
$vars{md_shocknode} = "";
my $conf = "awe.ini";
my $help = 0;
my $options = GetOptions ("metagenome_name=s" => \$vars{jobname},
                          "metagenome_datastore_id=s"   => \$vars{shocknode},
			  "metadata_datastore_id=s" => \$vars{md_shocknode},
                          "conf=s"    => \$conf,
                          "h"  => \$help
			 );

###############################################################################
#
# error-handling inputs...
#
###############################################################################

if ($help) {
    print_usage();
    exit 0;
}

my %missing;
foreach my $i (keys %vars) {
    if($vars{$i} eq "") {
        $missing{$i} = 1;
    }
}

if(keys %missing > 0) {
    print STDERR "\nERROR, the following required fields are missing:\n";
    foreach my $i (keys %missing) {
        print STDERR "$i\n";
    }
    print_usage();
    exit 1;
}

my $cfg = new Config::Simple($conf);
foreach my $i ('aweurl',
               'project',
               'clientgroups',
               'filter_options',
               'shockurl',
               'pipeline',
               'prefix_length',
               'dereplicate',
               'screen_indexes',
               'bowtie',
               'totalwork',
               'fgs_type',
               'aa_pid',
               'md5rna_clust',
               'rna_pid',
               'ach_annotation_ver',
               'mem_host') {
    if(defined $cfg->param($i)) {
        $vars{$i} = $cfg->param($i);
    } else {
        $missing{$i} = 1;
    }
}

if(keys %missing > 0) {
    print STDERR "\nERROR, the following parameters are missing from your config file ($conf):\n";
    foreach my $i (keys %missing) {
        print STDERR "$i\n";
    }
    print_usage();
    exit 1;
}

if(exists $ENV{"KB_AUTH_USER_ID"}) {
    $vars{user} = $ENV{"KB_AUTH_USER_ID"};
} elsif(defined $cfg->param('user') && defined $cfg->param('password')) {
    $vars{user} = $cfg->param('user');
    my $encoded = encode_base64($vars{user}.':'.$cfg->param('password'));
    my $ua = LWP::UserAgent->new();
    my $get = $ua->get("http://dev.metagenomics.anl.gov/api.cgi?auth=kbgo4711$encoded");
    unless($get->is_success) {
        print STDERR "ERROR, could not authenticate user, exiting.\n\n";
        exit 1;
    }
    my $json = new JSON();
    my $res = $json->decode( $get->content );
    unless(exists $res->{token}) {
        print STDERR "ERROR, could not authenticate user, exiting.\n\n";
        exit 1;
    }
} else {
    print STDERR "ERROR, user not authenticated, exiting.\n\n";
    exit 1;
}

###############################################################################
#
# Done handling inputs, now to check the Shock nodes for valid data and
#  validate the inputs.
#
###############################################################################

my $md_filename = "";
# Checking if files are in Shock and have a non-zero size.
print "\nINFO, validating file in Shock nodes.\n";
foreach my $var_name ('md_shocknode', 'shocknode') {
    my $snode_url = "http://".$vars{shockurl}.'/node/'.$vars{$var_name};
    my $ua = LWP::UserAgent->new();
    my $get = $ua->get($snode_url);
    unless ($get->is_success) {
        print STDERR "ERROR, could not retrieve Shock node for '$var_name' via url: $snode_url\n";
        exit 1;
    }

    my $json = new JSON();
    my $res = $json->decode( $get->content );
    my $size = $res->{data}->{file}->{size};
    if($size =~ /^\d+$/ && $size > 0) {
        print "INFO, Shock node for '$var_name' has a size of $size bytes.\n";
    } else {
        print STDERR "ERROR, Shock node for '$var_name' does not exist or is 0 bytes in size.\n";
        exit 1;
    }

    if($var_name eq 'md_shocknode') {
        $md_filename = $res->{data}->{file}->{name};
    } elsif($var_name eq 'shocknode') {
        $vars{inputfile} = $res->{data}->{file}->{name};
    }
}

# Downloading metadata file to validate it.
print "INFO, downloading metadata file for validation.\n";
my $ua = LWP::UserAgent->new();
my $get = $ua->get("http://".$vars{shockurl}.'/node/'.$vars{'md_shocknode'}."?download", ":content_file" => $md_filename);

print "INFO, validating metdata file.\n";
my $post = $ua->post("http://dev.metagenomics.anl.gov/api.cgi/metadata/validate",
                     Content_Type => 'form-data',
                     Content      => [ upload => [$md_filename] ]
                    );

my $json = new JSON();
my $res = $json->decode( $post->content );
if($res->{is_valid} == 0) {
    print STDERR "ERROR, your metadata file did not validate.\n";
    print STDERR $res->{message}."\n";
    print STDERR "Exiting without job submission.\n\n";
    exit 1;
} else {
    print "INFO, metadata validated.\n";
}

print "INFO, checking if jobname exists in metadata file as file_name or metagenome_name.\n";
my $job_found = 0;
foreach my $sample (@{$res->{metadata}->{samples}}) {
    foreach my $library (@{$sample->{libraries}}) {
        if((exists $library->{data}->{metagenome_name}->{value} && $vars{jobname} eq $library->{data}->{metagenome_name}->{value}) ||
           (exists $library->{data}->{file_name}->{value} && $vars{inputfile} eq $library->{data}->{file_name}->{value})) {
           $job_found = 1;
        }
    }
}

if($job_found == 0) {
    print STDERR "ERROR, jobname '".$vars{jobname}."' not found in any 'metagenome_name' field in metadata.\n";
    print STDERR "       and input file name '".$vars{inputfile}."' not found in any 'file_name' field in metadata.\n";
    print STDERR "Exiting without job submission.\n\n";
    exit 1;
} else {
    print "INFO, job found in metadata.\n";
}

###############################################################################
#
#  Now configure the pipeline and submit!
#
###############################################################################

print "INFO, configuring AWE pipeline with the specified parameters.\n";
# Replace # vars in template
my $text = read_file($vars{pipeline});
foreach my $key (keys %vars) {
    $text =~ s/#$key/$vars{$key}/g;
}

# Create an output file with unused filename
my $pipeline_outfile = $vars{pipeline}.".out";
my $tmp = $pipeline_outfile;
for(my $i=1; $i<=100; ++$i) {
    if(-e $tmp) {
        $tmp = "$pipeline_outfile.$i";
    }
}

if(-e $tmp) {
    print STDERR "ERROR, could not create output file: $pipeline_outfile because that file already exists.\n";
    print STDERR "Exiting without job submission.\n\n";
    exit 1;
}

$pipeline_outfile = $tmp;

print "INFO, writing file with configured pipeline to: $pipeline_outfile\n";
open OUT, ">$pipeline_outfile" || die "Cannot open file $pipeline_outfile for writing.\n";
print OUT $text;
close OUT;

print "INFO, submitting pipeline ($pipeline_outfile) to AWE.\n";
$ua = LWP::UserAgent->new();
$post = $ua->post("http://".$vars{aweurl}."/job",
                  Content_Type => 'form-data',
                  Content      => [ upload => [$pipeline_outfile] ]
                 );

$res = $json->decode( $post->content );

my $awe_dump_file = "awe_submission_output.txt";
print "INFO, writing AWE submission response to file ($awe_dump_file).\n";

open OUT, ">$awe_dump_file" || die "Could not open $awe_dump_file for writing.";
print OUT Dumper($res);
close OUT;

my $state = $res->{data}->{state};

if($state ne "submitted") {
    print STDERR "ERROR, AWE job submission was not successful, please see '$awe_dump_file' for more info.\n\n";
    exit 1;
}

my $awe_id = $res->{data}->{id};
my $job_id = $res->{data}->{jid};
print "INFO, AWE submission successful!\n";
print "INFO, AWE id = $awe_id\n";
print "INFO, job id = $job_id\n";
print "INFO, AWE url = http://".$vars{aweurl}."/job/$awe_id\n";
print "Done.\n\n";

sub print_usage {
    print "
Script for submitting metagenome to AWE
Command name: analyze_metagenome.pl
Parameters:
     -metagenome_name=<metagenome/file name for sequence file in datastore, must match any metagenome name in metadata file, required>
     -metagenome_datastore_id=<sequence/read file ID in datastore, required>
     -metadata_datastore_id=<metadata file ID in datastore, required>
     -conf=<configuration file, (default='awe.ini')>
\n";
}
