#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;
use Communities;

=pod

=head1 Testing Plan

=head2 Three initial tests

=over

=item Create new object

=item Is object in the Communities class?

=item Can the object do all described methods? (I<base_url json method request query project sample library TO_JSON>) 

=back

=head2 Method by Method Tests

=head3 base_url

Has a default value established in the 'new'.  If nothing is passed, then the
current value is unchanged.  This is both a getter and a setter.

=over 2

=item Pass null string return is the initial URL

=item Pass a specific test_value and return that same value

=item Pass null value again and return of last set value

=back

=head3 json

=over 2

=item Pass null string and object return is JSON reference

=item Pass non-null string and return is JSON reference

=item Pass JSON string and return is JSON reference

=back

=head3 method

This is a getter method only.  The default value of null is set in the 'new' method and never changed.

=over 2

=item Pass null string return is null

=item Pass non-null string return is null

=back

=head3 request

=over 2

=item Called with no parameters failed properly

=item Called with null parameters failed properly

=item Pass valid parameters 

=over 3

=item return reference is a hash

=item The key 'id' contains the requested id

=item The key 'type' contains the resource requested (project)

=back

=back

=head3 query

=over 2

=item Called with no parameters failed properly

=item Called with null parameters failed properly

=item Valid input parameters returns an array and the array is empty

=item JSON input parameters returns a hash

=item

=back

=head3 project

=over 2

=item null input parameters 

=over 3

=item returns a non-empty hash

=item key 'about' is metagenomics project

=item key 'projects' is a list (master list of projects)

=item The list is not empty

=item Take an item in the list for the next test

=back

=item Test with valid ID from the master list

=over 3

=item Return was a Communities::Project object

=item The id of the object is the same as the one requested

=back

=back

=head3 sample

=over 2

=item Same as project

=back

=head3 library

=over 2

=item Same as project

=back

=cut

#
#  Test 1 - Can a new object be created?
#

my $object = Communities->new(); # create a new object
ok( defined $object, "Did an object get defined for Communities" );               
#
#  Test 2 - Is the object in the right class?
#
isa_ok( $object, 'Communities', "Is it in the right class (Communities)" );   

#
#  Test 3 - Are the methods valid?
#

can_ok($object, qw[base_url json method request query project sample library TO_JSON]);

my $return;
my $test_value;

#----------------------------------------------------------------------------
#
#  METHOD base_url - Setter/Getter
#	This method sets the $object{base_url} to what is passed in
#	Null string results in no change to base_url
#
$test_value = '';
my $init_url   = 'http://communities.api.kbase.us';

$return = $object->base_url("$test_value");
is($object->{base_url}, $init_url, "base_url - Pass null string return is the initial URL");

$test_value = 'MYbaseURL';
$return = $object->base_url("$test_value");
is($object->{base_url}, $test_value, "base_url - Pass $test_value and return = $test_value");

$return = $object->base_url("");
is($object->{base_url}, $test_value, "base_url - Pass null value again and return of last set value");

#
#  Set it back to initial value to continue testing
#
$return = $object->base_url("$init_url");

#----------------------------------------------------------------------------
#
#  METHOD json - A getter only
#	Return json object handler
#

$test_value = '';
$return = $object->json("$test_value");
is(ref($object->{json}), 'JSON', "json -  Pass null string and object return is JSON reference");

$test_value = 'test_value';
$return = $object->json("$test_value");
is(ref($return), 'JSON', "json -  Pass non-null string and return is JSON reference");

$test_value = '{ "attribute":"value" }';
$return = $object->json("$test_value");
is(ref($return), 'JSON', "json -  Pass JSON string and return is JSON reference");

#----------------------------------------------------------------------------
#
#  METHOD method
#	Return method - getter but not a setter
#	Take a string that is in JSON and convert to Perl data structure

$test_value = '';
$return = $object->method("$test_value");
is($object->{method}, '', "method - Pass null string return is null");

$test_value = '{ "attribute":"value" }';
$return = $object->method("$test_value");
is($object->{method}, '', "method - Pass non-null string return is null");

#----------------------------------------------------------------------------
#
#  METHOD request
#  Input - Takes resource id query and params as inputs in this order
#	resource is a string that will be appended to the base URL
#	id is a string and will be validated as input the the query
#	query is a string and is appended to the URL
#	params is a reference to an array
#  Return
#	returns a hash with nothing in it if there is a bad ID (produces error message)
#	otherwise returns data from request query
#	returns Perl structure

$return = $object->request();
is(ref($return), 'HASH', "request - Pass no parameters and return reference is a hash");
is(scalar keys(%$return), 0, "request - Pass no parameters and hash is empty");

my $resource = '';
my @param    = ();
my $id       = '';
my $query    = '';
$return = $object->request($resource,$id,$query,\@param);
is(ref($return), 'HASH', "request - Pass empty parameters and return reference is a hash");
is(scalar keys(%$return), 0, "request - Pass empty parameters and hash is empty");

$resource = 'project_not_right';
@param    = ('test');  # nothing IS being done with this now
$id       = 'mgp127';
$query    = 'type=ontology&source=Subsystems';
$return = $object->request($resource,$id,$query,\@param);
is(ref($return), 'HASH', "request - Pass BAD resource and return reference is a hash");
#is(scalar keys(%$return), 0, "request - Pass BAD resource and hash is empty");

$resource = 'project';
@param    = ('test');  # nothing IS being done with this now
$id       = 'mgp127_not_right';
$query    = 'type=ontology&source=Subsystems';
$return = $object->request($resource,$id,$query,\@param);
is(ref($return), 'HASH', "request - Pass BAD ID and return reference is a hash");
is(scalar keys(%$return), 0, "request - Pass BAD ID and hash is empty");
foreach my $key (keys(%$return)) {
#      print "DEBUG: KEY=$key VALUE=$return->{$key} \n";  ## Each value in the hash 
}
print "DEBUG: ID=$return->{'id'} and RESOURCE=$return->{'type'}\n";;

$resource = 'project';
@param    = ('test');  # nothing IS being done with this now
$id       = 'mgp127';
$query    = 'type=ontol&source=Subsystems';
$return = $object->request($resource,$id,$query,\@param);
is(ref($return), 'HASH', "request - Pass BAD query parameter and return reference is a hash");
is(scalar keys(%$return), 0, "request - Pass BAD query parameter and hash is empty");
print "DEBUG: ID=$return->{'id'} and RESOURCE=$return->{'type'}\n";;


$resource = 'project';
@param    = ('test');  # nothing IS being done with this now
$id       = 'mgp127';
$query    = 'type=ontology&source=Subsystems';
$return = $object->request($resource,$id,$query,\@param);
is(ref($return), 'HASH', "request - Pass valid parameters and return reference is a hash");

is ($return->{'id'}, $id, 'request - Valid data, key id has requested id ');
is ($return->{'type'}, $resource, 'request - Valid data, key type has requested resouce');
print "DEBUG: ID=$return->{'id'} and RESOURCE=$return->{'type'}\n";;
foreach my $key (keys(%$return)) {
#      print "DEBUG: KEY=$key VALUE=$return->{$key} \n";  ## Each value in the hash 
}

$resource = '';
@param    = ();
$id       = '';
$query    = '';
$return = $object->request($resource,$id,$query,\@param);
is(ref($return), 'HASH', "request - Pass empty parameters and return reference is a hash");
is(scalar keys(%$return), 0, "request - Pass empty parameters and hash is empty");

 
#--------------------------------------------------------------------------t;-
#
#  METHOD query
#  Input - resource type (e.g., project), hash of key value pairs which are
#     attributes of the resource (e.g., public = 0 or 1 )
#  Return - A list of resources of this type  that have these attributes
#	The list is a hash 
#

$test_value = '';
#eval { $return = $object->query(); };
#isnt($@, '', 'query -  Called with no parameters failed properly');
#print "DEBUG: error=$@\n\n\n" if $@;
$return = $object->query();
is(ref($return), 'HASH', "query - No input parameters returns a HASH");
is(scalar keys(%$return), 0, "query - No input parameters returns an empty HASH");

my $rt = '';
my %att = (  );
#eval { $return = $object->query($rt,\%att); };
#isnt($@, '', 'query -  Called with null parameters failed properly');
#print "DEBUG: error=$@\n\n\n" if $@;
$return = $object->query($rt,\%att);
is(ref($return), 'HASH', "query - Null input parameters returns a HASH");
is(scalar keys(%$return), 0, "query - Null input parameters returns an empty HASH");

$rt = 'project_not_right';
%att = ( 'public' => 1 );
$return = $object->query($rt,\%att);
is(ref($return), 'HASH', "query - Bad resource parameter returns a HASH");

$rt = 'project';
%att = ( 'public' => 'NAN' );
$return = $object->query($rt,\%att);
is(ref($return), 'ARRAY', "query - Valid Resource but invalid attributes returns a ARRAY");
is(scalar @$return, 0, "query - Valid Resource but invalid attributes returns an empty ARRAY");
foreach (@$return) {
#      print "DEBUG: VALUE=$_ and its reference=".ref($_)." \n";  ## Each value in the hash 
}

$rt = 'project';
%att = ( 'public' => 1 );
$return = $object->query($rt,\%att);
is(ref($return), 'ARRAY', "query - Valid input parameters returns a ARRAY");
isnt(scalar @$return, 0, "query - Valid input parameters returns a non-empty ARRAY");

foreach my $item (@$return) {
#	print "DEBUG: VALUE=$item and its reference=".ref($item)." \n";  ## Each value in the array is a hash 
	is(ref($item), 'HASH', "query - ARRAY list contains HASH references");
	last;
}

#$test_value = "{ annotation : '16S rRNA' }";
#foreach my $key (keys(%$return)) {
#  print "Return for KEY $key = $return->{$key}\n";
#}

#----------------------------------------------------------------------------
#
#  METHOD project
#  Input - project id or empty 
#  Return - a Perl object for a project ID
#	With no input parameters, returns a hash with two keys, 
#   key1='metagenomics project' is a list of project IDs, key2 = 'about' 
#	for every key in the  hash should have a method (e.g., ID , version created, everything in the JSON structure (see new)
#
$return = $object->project();
is(ref($return), 'HASH', "project - null input parameters returns a hash");
isnt(scalar (keys %$return), 0, "project - null input parameters returns a non-empty hash");
is ($return->{'about'}, 'metagenomics project', 'project - key about is metagenomics');
is (ref($return->{'projects'}), 'ARRAY', 'project - key projects is an ARRAY');

my $list = $return->{'projects'};
isnt(scalar @$list, 0, 'project - ARRAY is not empty');

my $one_project_id = '';
foreach  (@$list) {
#	print "Items in the list = $_ ref=".ref($_)."\n";
	$one_project_id = $_;
}

$return = $object->project('Not_a_project_id');
is($return, '0', "project - BAD input parameters returns zero");

#print "DEBUG: MY ONE PROJECT ID = $one_project_id\n";
$return = $object->project($one_project_id);
is(ref($return), 'Communities::Project', "project - Valid input parameters returns a Communities::Project object");
my $test = $return->id;
is ($test,$one_project_id,"Is the ID that came back the same as the one requested");

#----------------------------------------------------------------------------
#
#  METHOD sample
#  Works the same as project
#
#
$return = $object->sample();
is(ref($return), 'HASH', "sample - null input parameters returns a hash");
isnt(scalar (keys %$return), 0, "sample - null input parameters returns a non-empty hash");
is ($return->{'about'}, 'sample', 'sample - key about is sample');
is (ref($return->{'samples'}), 'ARRAY', 'sample - key samples is an ARRAY');

$list = $return->{'samples'};
isnt(scalar @$list, 0, 'sample - ARRAY is not empty');

my $one_sample_id = '';
foreach  (@$list) {
#	print "Items in the list = $_\n";
	$one_sample_id = $_;
}

$return = $object->sample('Not_a_sample');
is($return, '0', "sample - Bad input parameters returns a zero");

print "DEBUG: MY ONE SAMPLE ID = $one_sample_id\n";
$return = $object->sample($one_sample_id);
is(ref($return), 'Communities::Sample', "sample - Valid input parameters returns a Communities::Sample");
$test = $return->id;
is ($test,$one_sample_id,"Is the ID that came back the same as the one requested");


#----------------------------------------------------------------------------
#
#  METHOD library
#  Works the same as project
#  Input - id and q
#  Return
#	List of available library IDs

$return = $object->library();
is(ref($return), 'HASH', "library - null input parameters returns a hash");
is(scalar (keys %$return), 0, "library - null input parameters returns a non-empty hash");
is ($return->{'about'}, 'library', 'library - key about is library');
is (ref($return->{'libraries'}), 'ARRAY', 'library - key libraries is an ARRAY');

$list = $return->{'libraries'};
isnt(scalar @$list, 0, 'library - ARRAY is not empty');

my $one_library_id = '';
foreach  (@$list) {
#	print "Items in the list = $_\n";
	$one_library_id = $_;
}
print "DEBUG: MY ONE LIBRARY ID = $one_library_id\n";

$return = $object->library('Not_a_library');
is($return, '', "library - Bad input parameters returns nothing");

$return = $object->library($one_library_id);
is(ref($return), 'Communities::Library', "library - Valid input parameters returns a Communities::Library");
my $test = $return->id;
is ($test,$one_library_id,"Is the ID that came back the same as the one requested");


#----------------------------------------------------------------------------
#
#  METHOD TO_JSON
#	JSON helper function
