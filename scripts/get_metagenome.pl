#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;

use LWP::UserAgent;

#use lib qw(/Users/tobiaspaczian/CODE/idserver/lib);
use Bio::KBase::IDServer::Client;

sub usage {
  print "get_metagenome.pl >>> retrieve a metagenome from the communities API\n";
  print "get_metagenome.pl -id <id of the metagenome>\n";
}

my $HOST='http://api.metagenomics.anl.gov/api2.cgi/metagenome/';
my $id     = '';

GetOptions ( 'id=s' => \$id );

unless ($id) {
  &usage();
  exit 0;
}

if ($id =~/^kb\|/){
  my $id_server_url = "http://bio-data-1.mcs.anl.gov:8080/services/idserver";
  my $idserver = Bio::KBase::IDServer::Client->new($id_server_url);
  my $return = $idserver->kbase_ids_to_external_ids( [ $id ]);
  $id = $return->{$id}->[1] ;
}

my $url = $HOST.$id."?verbosity=full";
my $ua = LWP::UserAgent->new;
print $ua->get($url)->content;