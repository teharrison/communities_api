#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;

use LWP::UserAgent;
use JSON;

use Bio::KBase::IDServer::Client;

sub usage {
  print "get_sample_list.pl >>> retrieve a list of samples from the communities API\n";
  print "get_sample_list.pl -id <id of the sample>\n"; 
}

sub help {
  my $text = qq~get_sample_list

retrieve a list of samples from the communities API


Options

	help - display this message

	user - username to authenticate against the API, requires a password to be set as well

	pass - password to authenticate against the API, requires a username to be set as well

	token - Globus Online authentication token

	webkey - MG-RAST webkey to synch with the passed Globus Online authentication

	verbosity - verbosity of the result data, can be one of [ 'minimal', 'verbose', 'full' ]

	limit - the maximum number of data items to be returned

	offset - the zero-based index of the first data item to be returned

~;
  system "echo '$text' | more";
}

my $HOST      = 'http://api.metagenomics.anl.gov/api2.cgi/sample/';
my $user      = '';
my $pass      = '';
my $token     = '';
my $verbosity = 'full';
my $help      = '';
my $webkey    = '';
my $offset    = '0';
my $limit     = '10';


GetOptions ( 'user=s' => \$user,
             'pass=s' => \$pass,
             'token=s' => \$token,
             'verbosity=s' => \$verbosity,
             'help' => \$help,
             'webkey=s' => \$webkey,
             'limit=s' => \$limit,
             'offset' => \$offset );

if ($help) {
  &help();
  exit 0;
}

if ($id =~/^kb\|/) {
  my $id_server_url = "http://bio-data-1.mcs.anl.gov:8080/services/idserver";
  my $idserver = Bio::KBase::IDServer::Client->new($id_server_url);
  my $return = $idserver->kbase_ids_to_external_ids( [ $id ]);
  $id = $return->{$id}->[1] ;
}

if ($user || $pass) {
  if ($user && $pass) {
    my $exec = 'curl -s -u '.$user.':'.$pass.' -X POST "https://nexus.api.globusonline.org/goauth/token?grant_type=client_credentials"';
    my $result = `$exec`;
    my $ustruct = "";
    eval {
      my $json = new JSON;
      $ustruct = $json->decode($result);
    };
    if ($@) {
      die "could not reach auth server";
    } else {
      if ($ustruct->{access_token}) {
        $token = $ustruct->{access_token};
      } else {
        die "authentication failed";
      }
    }
  } else {
    die "you must supply both username and password";
  }
}

my $url = $HOST.$id."?verbosity=$verbosity&limit=$limit&offset=$offset";
if ($webkey) {
  $url .= "&webkey=".$webkey;
}
my $ua = LWP::UserAgent->new;
if ($token) {
  $ua->default_header('user_auth' => $token);
}
print $ua->get($url)->content;
