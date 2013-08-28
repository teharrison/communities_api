#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;
use Data::Dumper ;
use LWP::UserAgent;
use JSON;

use Bio::KBase::IDServer::Client;

sub usage {
  print "get_metagenome.pl >>> retrieve a metagenome from the communities API\n";
  print "get_metagenome.pl -id <id of the metagenome>\n"; 
}

sub help {
  my $text = qq~get_metagenome

retrieve a metagenome from the communities API

Parameters

	id - the is of the metagenome to be retrieved from the API

Options

	help - display this message

	user - username to authenticate against the API, requires a password to be set as well

	pass - password to authenticate against the API, requires a username to be set as well

	token - Globus Online authentication token

	webkey - MG-RAST webkey to synch with the passed Globus Online authentication

	verbosity - verbosity of the result data, can be one of [ 'minimal', 'verbose', 'full' ]
~;
  system "echo '$text' | more";
}

my $HOST      = 'http://api.metagenomics.anl.gov/api2.cgi/metagenome/';
my $id        = '';
my $user      = '';
my $pass      = '';
my $token     = '';
my $verbosity = 'full';
my $help      = '';
my $webkey    = '';
my $limit     = 1000 ;
my @keys      = ();
my $format    = "txt" || "json" ;

GetOptions ( 'id=s' => \$id,
             'user=s' => \$user,
             'pass=s' => \$pass,
             'token=s' => \$token,
             'verbosity=s' => \$verbosity,
	     'limit=i'     => \$limit,
	     'field=s'   => \@keys,
	     'format=s'  => \$format,
             'help' => \$help,
             'webkey=s' => \$webkey );

if ($help) {
  &help();
  exit 0;
}
unless ($id) {
  #&usage();
  #exit 0;
}

if ($id =~/^kb\|/) {
  my $id_server_url = "http://www.kbase.us/services/idserver";
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

my $url = $HOST.$id."?verbosity=$verbosity";
$url .= "&limit=$limit" unless ($id);


if ($webkey) {
  $url .= "&webkey=".$webkey;
}
my $ua = LWP::UserAgent->new;
$ua->agent("KBaseClient/0.1 ");

if ($token) {
  $ua->default_header('user_auth' => $token);
}

while($url){
  my $content = $ua->get($url)->content;

  my $data = undef ;
  eval {
    my $json = new JSON;
    $data = $json->decode($content);
  };
  if ($@) {
    die "could not reach  server\n$@";
  } 
  else{

    # different data structure for single metagenome retrieval via id or list 
    my $list = [] ;
    if (defined $data->{data}) { 
      $list = $data->{data} ;
    }
    else{
      push @$list , $data ;
    }


    if ($format eq "json"){
      &print_json($data);
    }
    else{
      &print_txt( $list );
    }
   

  $url = $data->{next} || 0 ;
}



sub print_json {
  my ($data) = @_ ;
  my $json = new JSON;
  print $json->encode($data);
};

sub print_txt  {
  my ($data) = @_ ;
  
  # print to stdout 
    foreach my $mg (@$data) {

      unless(@keys){
	print $mg->{id} , "\n" ;
      }
      elsif( scalar @keys == 1 and $keys[0] eq "all"){
	
	print join "\t" , ( map { ref $mg->{$_} ? (( ref $mg->{$_} eq 'ARRAY') ? $mg->{$_}->[0] : "- $_ -" ) : $mg->{$_} } keys %$mg ) ;
	print "\n" ;
     

      }
      else{

	  print join "\t" , ( map { $mg->{$_} }  @keys  ) ;
	  print "\n" ;

      }
      #print Dumper $mg ;
      #exit;
    }
  }  

};
