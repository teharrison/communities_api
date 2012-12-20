use strict;
use warnings;
use LWP::UserAgent;
use JSON;

use Data::Dumper;

use lib "/Users/Andi/Development/kbase/communities_qc/client" ;
use lib "/Users/Andi/Development/kbase/kb_seed/lib/" ;





=pod

=head1 Communities API 

=head2 Tutorials

=over 2

=item Data Access

=over 2

=item Pointing th the service

=item Retrieve sample data

=item Retrieve abundance profile

=back

=item Retrieving documentation

=back

=cut


=pod 

=head3 Pointing to the service

I order to get started a client object has to be initialzed.
First define the service url. Data is returned in JSON format 
and needs to be converted into internal data structure.

 my $HOST='http://kbase.us/services/communities/';
 my $json = JSON->new->allow_nonref;

 my $ua = LWP::UserAgent->new;
 $ua->agent("KBaseClient/0.1 ");

=cut

my $HOST='http://kbase.us/services/communities';

# initialize JASON OO-interface
my $json = JSON->new->allow_nonref;

my $ua = LWP::UserAgent->new;
$ua->agent("KBaseClient/0.1 ");

=pod

=head3 Retrieve Sample data

For a metagenome in KBase Auxiliary Store retrieve summary data.
Please substitue the ID with your data set ID 

=head4 Perl

 my $id       = "mgm4440026.3" ;
 my $resource = "metagenome";

 # build URL
 my $url      = join "/" , $HOST , $resource , $id ; 

 # make request
 my $content = $ua->get($url)->content;
 
 # $content is in a string in json encoding , decode data and create Perl data structure
 my $data    = $c->json->decode( $content );

=cut

{
  my $resource = "metagenome";
  my $id       = "mgm4440026.3";
  my $url      = join "/" , $HOST , $resource , $id ; 
  
  my $content = $ua->get($url)->content;
  my $data    = $json->decode( $content );
  
  print Dumper $data ;
}


=pod

=head4 Using curl on the command line

You can use curl on the command line to retrieve the same data:
 
 curl 'http://kbase.us/services/communities/metagenome/mgm4440026.3?verbosity=full'

There are many tools out there to prettify the return results, try piping the output to json_xs for example

 curl 'http://kbase.us/services/communities/metagenome/mgm4440026.3?verbosity=full' | json_xs

=cut

my $call    = "curl 'http://kbase.us/services/communities/metagenome/mgm4440026.3'" ;

# invoking shell
my $content = `$call` ;
my $data    = $json->decode( $content );

print Dumper $data ;






=pod

The first example returned minimum information. To obtain a more detailed view you have to increase the B<verbosity> level.
Valid values for B<verbosity> are I<minimum> , I<verbose> and I<full>.

=head4 Perl

  my $resource = "metagenome";
  my $id       = "mgm4440026.3";

  # set options
  my $options  = "verbosity=full" ;
  my $url      = join "/" , $HOST , $resource , $id ; 
  
  # add options to URL
  $url .= "?".$options if ($options);
  my $content = $ua->get($url)->content;
  my $data    = $json->decode( $content );


=cut

{
  my $resource = "metagenome";
  my $id       = "mgm4440026.3";
  my $options  = "verbosity=full" ;
  my $url      = join "/" , $HOST , $resource , $id ; 
  
  $url .= "?".$options if ($options);

  my $content = $ua->get($url)->content;
  my $data    = $json->decode( $content );
  
  print Dumper $data ;
}

=pod

=head4 Using curl on the command line

 curl "http://kbase.us/services/communities/metagenome/mgm4440026.3?verbosity=full" 

=cut

my $call    = "curl 'http://kbase.us/services/communities/metagenome/mgm4440026.3?verbosity=full'" ;
my $content = `$call` ;
my $data    = $json->decode( $content );

print Dumper $data ;



=pod

=head3 Retrieve abundance profile 

Retrieve an abundance profile for a metagenome. The name for the resource is B<abundanceprofile>.

  # set resource name
  my $resource = "abundanceprofile";
  my $id       = "mgm4440026.3";
  my $url      = join "/" , $HOST , $resource , $id ; 
  
  my $content = $ua->get($url)->content;
  
  # check for ERROR
  if ($content =~/^ERROR/){
    print STDERR "Error for $url \n$content\n" ;
    exit 0;
  }
  
  my $data    = $json->decode( $content );

 
=cut

{
  my $resource = "abundanceprofile";
  my $id       = "mgm4440026.3";
  my $url      = join "/" , $HOST , $resource , $id ; 
  
  my $content = $ua->get($url)->content;
  
  if ($content =~/^ERROR/){
    print STDERR "Error for $url \n$content\n" ;
    exit 0;
  }
  
  my $data    = $json->decode( $content );
  
  print Dumper $data ;
}

exit ;
 
=pod

=head3 Available resources

The service is self documented. Calling the service without any resource or options will return a list of available resources.

=head4 Using curl on the command line

=head4 Perl


=cut
