#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;
use Communities;

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
#  METHOD json
#	Return json object handler
#

$test_value = '';
$return = $object->json("$test_value");
is(ref($object->{json}), 'JSON', "json -  Pass null string and return is JSON reference");

$test_value = 'test_value';
$return = $object->json("$test_value");
is(ref($object->{json}), 'JSON', "json -  Pass non-null string and return is JSON reference");

#----------------------------------------------------------------------------
#
#  METHOD method
#	Return method - getter but not a setter
#
$test_value = '';
$return = $object->method("$test_value");
is($object->{method}, '', "method - Pass null string return is null");

$test_value = 'test_value';
$return = $object->method("$test_value");
is($object->{method}, '', "method - Pass non-null string return is null");

#----------------------------------------------------------------------------
#
#  METHOD request
#  Input - Takes resource id query and params as inputs in this order
#	resource is a string that will be appended to the base URL
#	params is a reference to an array
#	id is a string and will be validated as input the the query
#	query is a string and is appended to the URL
#  Return
#	returns 0 if there is a bad ID
#	otherwise returns data from request query
#

TODO: {
local $TODO = "request method without parameters fails in a bad way";
$test_value = '';
#$return = $object->request($test_value);
}

TODO: {
local $TODO = "request method with null parameters fails in a bad way";
my $resource = '';
my @param    = ();
my $id       = '';
my $query    = '';
#$return = $object->request($resource,\@param,$id,$query);
}

#----------------------------------------------------------------------------
#
#  METHOD query
#

TODO: {
local $TODO = "query method without input parameters fails in a bad way";
$test_value = '';
#$return = $object->query($test_value);
#is(ref($return), 'HASH', "query - null input parameters returns a hash");
#is(scalar (keys %$return), 0, "query - null input parameters returns an empty hash");
}

$test_value = 'bad_value';
$return = $object->query($test_value);
is($return, 'ERROR:  ERROR: Invalid parameters - invalid object type: Bad_value', "query - input parameters that are not recognized produce ERROR");


$test_value = "{ annotation : '16S rRNA' }";
$test_value = "16S rRNA";
$return = $object->query($test_value);
is($return, , "query -  JSON input parameters returns a hash");
is(scalar (keys %$return), 0, "query - null input parameters returns an empty hash");
print "DEBUG: Query without input parameters = $return\n";

foreach my $key (keys(%$return)) {
  print "Return for KEY $key = $return->{$key}\n";
}
#----------------------------------------------------------------------------
#
#  METHOD project
$return = $object->project();
is(ref($return), 'HASH', "project - null input parameters returns a hash");
is(scalar (keys %$return), 0, "project - null input parameters returns an empty hash");
print "DEBUG: Project without input parameters = $return\n";

#----------------------------------------------------------------------------
#
#  METHOD sample
$return = $object->sample();
is(ref($return), 'HASH', "sample - null input parameters returns a hash");
is(scalar (keys %$return), 0, "sample - null input parameters returns an empty hash");
print "DEBUG: Sample without input parameters = $return\n";

#----------------------------------------------------------------------------
#
#  METHOD library
#  Input - id and q
#	id - mandatory
#  Return
#	List of available library IDs

$return = $object->library();
is(ref($return), 'HASH', "library - null input parameters returns a hash");
is(scalar (keys %$return), 0, "library - null input parameters returns an empty hash");
print "DEBUG: Library without input parameters = $return\n";

#----------------------------------------------------------------------------
#
#  METHOD TO_JSON
#	JSON helper function
