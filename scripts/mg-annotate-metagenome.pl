#!/kb/runtime/bin/perl

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

my $OAUTH_URL = 'https://nexus.api.globusonline.org/goauth/token?grant_type=client_credentials';

=head1 NAME

mg-annotate-metagenome -- submit a metagenome to be annotated by the microbial communities pipeline

=head1 VERSION

2

=head1 SYNOPSIS

mg-annotate-metagenome [-h] [-m metadata_file_id] [-u user] [-p password] [-t token] [-c conf_file] -n metagenome_name -f sequence_file_id

=head1 DESCRIPTION

Submit a metagenome to be annotated by the microbial communities pipeline.  If you are working in IRIS and are authenticated, you do not need to enter a user, password, or token to submit a metagenome to the pipeline.  Otherwise, you can enter a user and password or a token to authenticate but not both.

Parameters:

=over 8

=item -n

metagenome/file name for sequence file in datastore, must match any metagenome name in metadata file

=item -f

sequence/read file ID in datastore

=back

Options:

=over 8

=item -h

display this help message

=item -m

metadata file ID in datastore

=item -u

username to authenticate against the API, requires a password to be set as well

=item -p

password to authenticate against the API, requires a username to be set as well

=item -t

Globus Online authentication token

=item -c

configuration file (default is 'deploy.cfg')

=back

Output:

JSON structure that contains the result data

=head1 EXAMPLES

-

=head1 SEE ALSO

-

=head1 AUTHORS

Jared Bischof, Travis Harrison, Folker Meyer, Tobias Paczian, Andreas Wilke

=cut

# parameters
my %vars = ();
$vars{metagenome_name} = "";
$vars{sequence_file_id} = "";
$vars{metadata_file_id} = "";
$vars{user} = "";
$vars{password} = "";
$vars{token} = "";
my $conf = "deploy.cfg";
my $help = 0;
my $options = GetOptions ("n=s"  => \$vars{metagenome_name},
                          "f=s"  => \$vars{sequence_file_id},
			  "m=s"  => \$vars{metadata_file_id},
			  "u=s"  => \$vars{user},
			  "p=s"  => \$vars{password},
			  "t=s"  => \$vars{token},
                          "c=s"  => \$conf,
                          "help" => \$help
			 );

if ($help) {
    print_usage();
    exit 0;
}

# error-handling inputs...
my %missing;
foreach my $i ('metagenome_name', 'sequence_file_id') {
    if($vars{$i} eq "") {
        $missing{$i} = 1;
    }
}

if(($vars{user} ne "" && $vars{token} ne "") || ($vars{password} ne "" && $vars{token} ne "")) {
    print STDERR "\nERROR, the user and password options are incompatible with the token option.\n";
    print "\nExiting, use the -h option to get help.\n\n";
    exit 1;
}

if(keys %missing > 0) {
    print STDERR "\nERROR, the following parameters are missing from your command:\n";
    foreach my $i (keys %missing) {
        print STDERR "  $i\n";
    }
    print "\nExiting, use the -h option to get help.\n\n";
    exit 1;
}

my $cfg = new Config::Simple($conf);
my $p_cfg = $cfg->param(-block=>'communities_pipeline');
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
    if(defined $p_cfg->{$i}) {
        $vars{$i} = $p_cfg->{$i};
    } else {
        $missing{$i} = 1;
    }
}

if(keys %missing > 0) {
    print STDERR "\nERROR, the following parameters are missing from your config file ($conf):\n";
    foreach my $i (keys %missing) {
        print STDERR "  $i\n";
    }
    print "\nExiting, use the -h option to get help.\n\n";
    exit 1;
}

my $token = "";
if(exists $ENV{"KB_AUTH_TOKEN"}) {
    $token = $ENV{"KB_AUTH_TOKEN"};
} elsif($vars{token} ne "") {
    $token = $vars{token};
} elsif($vars{user} ne "" && $vars{password} ne "") {
    my $encoded = encode_base64($vars{user}.':'.$vars{password});
    my $json = new JSON();
    my $pre = `curl -s -H "Authorization: Basic $encoded" -X POST "https://nexus.api.globusonline.org/goauth/token?grant_type=client_credentials"`;
    eval {
        my $res = $json->decode($pre);
        unless(exists $res->{access_token}) {
            print STDERR "ERROR, could not authenticate user, exiting.\n\n";
            exit 1;
        }
        $token = $res->{access_token};
    };
    if ($@) {
        print STDERR "could not reach auth server: $@\n";
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
foreach my $var_name ('metadata_file_id', 'sequence_file_id') {
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

    if($var_name eq 'metadata_file_id') {
        $md_filename = $res->{data}->{file}->{name};
    } elsif($var_name eq 'sequence_file_id') {
        $vars{inputfile} = $res->{data}->{file}->{name};
    }
}

# Downloading metadata file to validate it.
print "INFO, downloading metadata file for validation.\n";
my $ua = LWP::UserAgent->new();
my $get = $ua->get("http://".$vars{shockurl}.'/node/'.$vars{'metadata_file_id'}."?download", ":content_file" => $md_filename);

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

print "INFO, checking if metagenome_name exists in metadata file as file_name or metagenome_name.\n";
my $job_found = 0;
foreach my $sample (@{$res->{metadata}->{samples}}) {
    foreach my $library (@{$sample->{libraries}}) {
        if((exists $library->{data}->{metagenome_name}->{value} && $vars{metagenome_name} eq $library->{data}->{metagenome_name}->{value}) ||
           (exists $library->{data}->{file_name}->{value} && $vars{inputfile} eq $library->{data}->{file_name}->{value})) {
           $job_found = 1;
        }
    }
}

if($job_found == 0) {
    print STDERR "ERROR, metagenome_name '".$vars{metagenome_name}."' not found in any 'metagenome_name' field in metadata.\n";
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
    system("perldoc $0 | cat");
}
