#!/usr/bin/perl -w
use strict;

use Data::Dumper;
use Test::More 'no_plan';
use lib "test/client-tests";
use ReturnTests;

my $num_tests = 0;
#my $host = "http://www.kbase.us/services/communities";
my $host = "http://api.metagenomics.anl.gov/api2.cgi";

###############################################################################
# Test the module initialization process
# (5 tests)
use_ok("CommunitiesAPIClient");
use_ok("Bio::KBase::Exceptions");
my $client = new_ok("CommunitiesAPIClient", [$host]);
ok(defined $client, "Did we get a client object?");
isa_ok($client, 'CommunitiesAPIClient', "Is it the right class?");

$num_tests += 5;

$num_tests += test_sample_query($client);
$num_tests += test_sample_instance($client);

done_testing($num_tests);

sub test_sample_query {
	my $client = shift;
    my $num_tests = 0;
    my $test_name = "get_sample_query";

	my %attributes = (
					'next' => 'S',
					'prev' => 'S',
					'order' => 'S',
					'limit' => 'S',
					'data' => 'L',
					'offset' => 'S',
					'total_count' => 'S'
					);

	# valid parameters for the call =
	# verbosity (def. minimal) minimal
	# order (def id) id, name
	# limit (no default) 1...?
	# offset (no default) 0...?

	my $return;
	my $error;

	#######################################################################
	# happy path tests
	# ----------------
	# 1. verbosity = minimal, order = id, limit = 10, offset = 0
	eval { $return = $client->$test_name({ verbosity => 'minimal', order => 'id', limit => 10, offset => 0 }); };
	is($@, '', "Calling \"$test_name\" with valid data passed successfully.");
	$num_tests++;
	unless ($@) { $num_tests += ReturnTests::test_result($return, \%attributes, { verbosity => 'minimal', order => 'id', limit => 10, offset => 0 }); }

	# 2. Let order = "name"
	eval { $return = $client->$test_name({ verbosity => 'minimal', order => 'name', limit => 10, offset => 0 }); };
	is($@, '', "Calling \"$test_name\" with valid data passed successfully.");
	$num_tests++;
	unless ($@) { $num_tests += ReturnTests::test_result($return, \%attributes, { verbosity => 'minimal', order => 'name', limit => 10, offset => 0 }); }

	# 3. Let verbosity = default
	eval { $return = $client->$test_name({ order => 'id', limit => 10, offset => 0 }); };
	is($@, '', "Calling \"$test_name\" with default verbosity passed successfully.");
	$num_tests++;
	unless ($@) { $num_tests += ReturnTests::test_result($return, \%attributes, { order => 'id', limit => 10, offset => 0 }); }

	# 4. Let order = default
	eval { $return = $client->$test_name({ verbosity => 'minimal', limit => 10, offset => 0 }); };
	is($@, '', "Calling \"$test_name\" with default order passed successfully.");
	$num_tests++;
	unless ($@) { $num_tests += ReturnTests::test_result($return, \%attributes, { verbosity => 'minimal', limit => 10, offset => 0 }); }

	# 5. Let limit be default
	eval { $return = $client->$test_name({ verbosity => 'minimal', order => 'id', offset => 0 }); };
	is($@, '', "Calling \"$test_name\" with default limit passed successfully.");
	$num_tests++;
	unless ($@) { $num_tests += ReturnTests::test_result($return, \%attributes, { verbosity => 'minimal', order => 'id', offset => 0 }); }

	# 6. Let offset be default
	eval { $return = $client->$test_name({ verbosity => 'minimal', order => 'id', limit => 10}); };
	is($@, '', "Calling \"$test_name\" with default offset passed successfully.");
	$num_tests++;
	unless ($@) { $num_tests += ReturnTests::test_result($return, \%attributes, { verbosity => 'minimal', order => 'id', limit => 10 }); }

	# 7. Let offset be nonzero
	eval { $return = $client->$test_name({ verbosity => 'minimal', order => 'id', limit => 10, offset => 10 }); };
	is($@, '', "Calling \"$test_name\" with nonzero offset passed successfully.");
	$num_tests++;
	unless ($@) { $num_tests += ReturnTests::test_result($return, \%attributes, { verbosity => 'minimal', order => 'id', limit => 10, offset => 10 }); }

	#######################################################################
	# invalid parameter tests - should fail nicely
	# --------------------------------------------
	# 1. verbosity = blah
	eval { $return = $client->$test_name({ verbosity => 'blah', order => 'id', limit => 10, offset => 0 }); };
	$error = $@;
	ok($error, "Calling '$test_name' with verbosity = 'blah' properly returns an error.");
	$num_tests++;
	if ($error) {
		$num_tests += ReturnTests::test_error_value($error, "Bio::KBase::Exceptions::JSONRPC", 400, qr/Invalid value for option verbosity/i);
	}

	# 2. order = blah
	eval { $return = $client->$test_name({ verbosity => 'minimal', order => 'blah', limit => 10, offset => 0 }); };
	$error = $@;
	ok($error, "Calling '$test_name' with order = 'blah' properly returns an error.");
	$num_tests++;
	if ($error) {
		$num_tests += ReturnTests::test_error_value($error, "Bio::KBase::Exceptions::JSONRPC", 400, qr/Invalid sort order/i);
	}


	undef $return;
	undef $error;
	eval { $return = $client->$test_name(); };
	ok($@, "Calling '$test_name' with no parameters returns an error.");
	$num_tests++;
	$error = $@;
	if ($error) {
		$num_tests += ReturnTests::test_error_value($error, "Bio::KBase::Exceptions::ArgumentValidationError", 400, qr/Invalid/i);
	}

	undef $return;
	undef $error;
	eval { $return = $client->$test_name({}); };
	ok($return, "Calling '$test_name' with empty parameters returns something.");
	$num_tests++;

	$error = $@;
	if ($return) {
		note"Checking if calling '$test_name' with empty parameters returns a method description object";
		$num_tests += ReturnTests::test_method_description($return);
	}

    return $num_tests;
}

sub test_sample_instance {
	my $client = shift;
    my $num_tests = 0;

    my $test_name = "get_sample_instance";
	my $test_id = "mgs24887";
	my @verbosities = ( 'minimal', 'verbose', 'full' );

	my %attributes = (
						'version' => 'S',
						'project' => 'L',
						'name' => 'S',
						'metagenomes' => 'LL',
						'libraries' => 'LL',
						'env_package' => 'M',
						'created' => 'S',
						'url' => 'S',
						'id' => 'S',
						'metadata' => 'M',
					);

	my $return;
	my $error;

	###########################################################################
	# Happy path tests
	# ----------------
	# loop through every verbosity with a single id and make sure they're good.
	foreach my $verbosity (@verbosities) {
		my $params = { 
						'id' => $test_id,
						'verbosity' => $verbosity
					};
		eval { $return = $client->$test_name($params); };
		is($@, '', "Calling '$test_name' with verbosity='$verbosity' and id='$test_id' passed successfully.");
		$num_tests++;

		if ($return) {
			$num_tests += ReturnTests::test_result($return, \%attributes, $params);
		}
	}

	###########################################################################
	# Invalid param tests
	# -------------------
	# 1. No parameters
	undef $return;
	undef $error;
	eval { $return = $client->$test_name(); };
	$error = $@;
	ok($error, "Calling '$test_name' with no parameters returns an error.");
	$num_tests++;
	if ($error) {
		$num_tests += ReturnTests::test_error_value($error, "Bio::KBase::Exceptions::ArgumentValidationError", 400, qr/Invalid/i);
	}

	undef $return;
	undef $error;
	eval { $return = $client->$test_name({}); };
	ok($return, "Calling '$test_name' with empty parameters returns something.");
	$num_tests++;
	if ($return) {
		note"Checking if calling '$test_name' with no parameters returns a method description object";
		$num_tests += ReturnTests::test_method_description($return);
	}


	# 2. No id
	undef $return;
	undef $error;
	eval { $return = $client->$test_name({ verbosity=>'minimal' }); };
	ok($return, "Calling '$test_name' with no id returns something.");
#	isnt($@, '', "Calling '$test_name' with no id gives an error");
	$num_tests++;

	# 3. Invalid verbosity
	undef $return;
	undef $error;
	eval { $return = $client->$test_name({ id=>$test_id, verbosity=>"blah" }); };
	isnt($@, '', "Calling '$test_name' with an invalid verbosity gives an error");
	$error = $@;
	$num_tests++;
	if ($error) {
		$num_tests += ReturnTests::test_error_value($error, "Bio::KBase::Exceptions::JSONRPC", 400, qr/Invalid/i);
	}

    return $num_tests;
}
