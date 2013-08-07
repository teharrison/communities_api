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

=back

=cut


=pod 

=head2 Pointing to the service

I order to get started a client object has to be initialzed.
First define the service url. Data is returned in JSON format 
and needs to be converted into internal data structure.

 my $HOST='http://kbase.us/services/communities/';
 my $json = JSON->new->allow_nonref;

 my $ua = LWP::UserAgent->new;
 $ua->agent("KBaseClient/0.1 ");

=cut

my $HOST='http://kbase.us/services/communities/';

# initialize JASON OO-interface
my $json = JSON->new->allow_nonref;

my $ua = LWP::UserAgent->new;
$ua->agent("KBaseClient/0.1 ");

=pod

=head2 Retrieve Sample data

For a metagenome in KBase Auxiliary Store retrieve summary data.
Please substitue the ID with your data set ID 

 my $id       = "kb|mgm4440026.3" ;
 my $resource = "metagenome";
 my $url      = join "/" , $HOST , $resource , $id ; 

 my $content = $ua->get($url)->content;
 my $data    = $c->json->decode( $content );

=cut

my $resource = "metagenome";
my $id       = "mgm4440026.3";
my $url      = join "/" , $HOST , $resource , $id ; 

my $content = $ua->get($url)->content;
my $data    = $json->decode( $content );





=pod

=head2 Retrieve abundance profile 

Retrieve abundance profile.

 
=cut



my $resource = "abundanceprofile";
my $id       = "mgm4440026.3";
my $url      = join "/" , $HOST , $resource , $id ; 

my $content = $ua->get($url)->content;
my $data    = $json->decode( $content );

print Dumper $data ;


exit ;
 
