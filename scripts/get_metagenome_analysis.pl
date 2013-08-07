#!/kb/runtime/bin/perl

#Script for viewing list of and optionally downloading output files from an analyzed metagenome in AWE
#Command name: check_metagenome.pl
#Parameters:
#     -awe_job_url=<url for AWE job, required>
#     -download <option variable to download output files>
#     -conf=<configuration file (default='awe.ini')>

use strict;
use warnings;
no warnings('once');

use JSON;
use Config::Simple;
use Getopt::Long;
use LWP::UserAgent;
use MIME::Base64;
umask 000;

# parameters
my $awe_job_url = "";
my $download;
my $conf = "awe.ini";
my $help = 0;
my $options = GetOptions ("awe_job_url=s" => \$awe_job_url,
                          "download" => \$download,
                          "conf=s"    => \$conf,
                          "h"  => \$help
                         );

if($help) {
    print_usage();
    exit 0;
}

if($awe_job_url eq "") {
    print STDERR "\nERROR, missing the required field 'awe_job_url'.\n";
    print_usage();
    exit 1;
}

my $cfg = new Config::Simple($conf);

my $user;
if(exists $ENV{"KB_AUTH_USER_ID"}) {
    $user = $ENV{"KB_AUTH_USER_ID"};
} elsif(defined $cfg->param('user') && defined $cfg->param('password')) {
    $user = $cfg->param('user');
    my $encoded = encode_base64($user.':'.$cfg->param('password'));
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

my $ua = LWP::UserAgent->new();
my $get = $ua->get($awe_job_url);

unless ($get->is_success) {
    print STDERR "Could not retrieve AWE job via url: $awe_job_url";
    exit 1;
}

my $json = new JSON();
my $res = $json->decode( $get->content );
my $job_state = "";

if($download) {
    print "\nDownloading output files:\n";
} else {
    print "\nListing output files:\n";
}

if(exists $res->{data}->{tasks}) {
    foreach my $task (@{$res->{data}->{tasks}}) {
        if(exists $task->{outputs}) {
            foreach my $output (keys %{$task->{outputs}}) {
                # Print filename
                print "$output\n";
                my $file_obj = $task->{outputs}->{$output};
                if($download) {
                    # Download file
                    my $get = $ua->get($file_obj->{url}, ":content_file" => $output);
                    unless($get->is_success) {
                        print STDERR "Failed to download $output\n";
                        exit 1;
                    }
                    # Get file information
                    my $node_url = $file_obj->{host}."/node/".$file_obj->{node};
                    my $get_info = $ua->get($node_url);
                    unless($get_info->is_success) {
                        print STDERR "Could not retrieve file info for $output at url: $node_url\n";
                        exit 1;
                    }
                    my $info = $json->decode( $get_info->content );
                    # Print file size and md5sum
                    unless(exists $info->{data}->{file}->{size} &&
                           exists $info->{data}->{file}->{checksum}->{md5}) {
                        print STDERR "Could not retrieve file size and md5sum for $output at url: $node_url\n";
                        exit 1;
                    }
                    print "bytes=".$info->{data}->{file}->{size}."\n";
                    print "md5sum=".$info->{data}->{file}->{checksum}->{md5}."\n";
                    print "\n";
                }
            }
        }
    }
}
print "\n";

sub print_usage {
    print "
Script for viewing list of and optionally downloading output files from an analyzed metagenome in AWE
Command name: check_metagenome.pl
Parameters:
     -awe_job_url=<url for AWE job, required>
     -download <option variable to download output files>
     -conf=<configuration file (default='awe.ini')>
\n";
}
