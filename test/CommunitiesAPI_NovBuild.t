#!/usr/bin/perl -w
use strict;

#use CommunitiesAPIClient;
use Data::Dumper;
use Test::More 'no_plan';

my $num_tests = 0;

###############################################################################
# Test the module initialization process
# (4 tests)
use_ok("CommunitiesAPIClient");

my $host = "http://www.kbase.us/services/communities";
# $host = "http://api.metagenomics.anl.gov/api2.cgi";

my $client = new_ok("CommunitiesAPIClient", [$host]);

ok(defined $client, "Did we get a client object?");
isa_ok($client, 'CommunitiesAPIClient', "Is it the right class?");

$num_tests+=4;

$num_tests += test_abundanceprofile_instance($client);
$num_tests += test_library_query($client);
$num_tests += test_library_instance($client);
$num_tests += test_metagenome_query($client);
$num_tests += test_metagenome_instance($client);
$num_tests += test_project_query($client);
$num_tests += test_project_instance($client);
$num_tests += test_sample_query($client);
$num_tests += test_sample_instance($client);
$num_tests += test_sequences_md5($client);
$num_tests += test_sequences_annotation($client);
$num_tests += test_sequenceset_instance($client);
$num_tests += test_sequenceset_list($client);

done_testing($num_tests);

# Tests the command "get_abundanceprofile_instance"
sub test_abundanceprofile_instance {
	my $client = shift;
	my $num_tests = 0;
	my $test_name = "get_abundanceprofile_instance";

	my %attributes = (
                    'generated_by'=>'S',
                    'matrix_type'=>'S',
                    'date'=>'S',
                    'data'=>'L',
                    'rows'=>'L',
                    'matrix_element_type'=>'S',
                    'format_url'=>'S',
                    'format'=>'S',
                    'columns'=>'L',
                    'id'=>'S',
                    'type'=>'S',
                    'shape'=>'L'
                   );

	my $test_id = "mgm4440286.3";
	my @verbosities = ( 'minimal', 'verbose', 'full' );
	my $sources = {
		'M5RNA' => {
			allowed => ['organism', 'feature'],
			not_allowed => ['function']
		},
		'RDP' => {
			allowed => ['organism', 'feature'],
			not_allowed => ['function']
		},
		'Greengenes' => {
			allowed => ['organism', 'feature'],
			not_allowed => ['function']
		},
		'LSU' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'SSU' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'M5NR' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'SwissProt' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'GenBank' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'IMG' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'KEGG' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'SEED' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'TrEMBL' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'RefSeq' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'PATRIC' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'eggNOG' => {
                        allowed => ['organism', 'feature'],
                        not_allowed => ['function']
                },
		'NOG' => {
			allowed => ['function'],
			not_allowed => ['organism', 'feature'],
		},
		'COG' => {
                        allowed => ['function'],
                        not_allowed => ['organism', 'feature'],
                },
		'KO' => {
                        allowed => ['function'],
                        not_allowed => ['organism', 'feature'],
                },
		'GO' => {
                        allowed => ['function'],
                        not_allowed => ['organism', 'feature'],
                },
		'Subsystems' => {
                        allowed => ['function'],
                        not_allowed => ['organism', 'feature'],
                },
	};

	# major variable for return values
	my $return;

	#######################################################################
	# invalid data tests
	# ------------------
	# 1. bad id test
	
	# 2. bad source db test
	
	# 3. bad type test
	
	# 4. bad verbosity test

	#######################################################################
	# missing parameter tests
	# -----------------------
	# 1. no id test
	eval { $return = $client->get_abundanceprofile_instance({ source => 'M5RNA', verbosity => 'minimal', type => 'organism'}); };
	like($@, qr/Invalid argument count/, "\"$test_name\" called with no id failed properly");
	$num_tests++;

	# 2. no source test (should go to default - M5RNA)
	eval { $return = $client->get_abundanceprofile_instance({ id => $id_test, verbosity => 'minimal', type => 'organism'}); };
	$num_tests++;

	# 3. no verbosity test (should go to default - minimal)
        eval { $return = $client->get_abundanceprofile_instance({ id => $id_test, source => 'M5RNA', type => 'organism'}); };
        $num_tests++;

	# 4. no type test (should go to default - organism)
        eval { $return = $client->get_abundanceprofile_instance({ id => $id_test, verbosity => 'minimal', source=>'M5RNA'}); };
        $num_tests++;

	# 5. no parameters test
	eval { $return = $client->get_abundanceprofile_instance() };
	like($@, qr/Invalid argument count/, "\"$test_name\" called with no parameters failed properly");

	#######################################################################
	# valid parameter tests
	# ---------------------
	foreach my $verbosity (@verbosities) {
		foreach my $source (keys %{ $sources }) {
			foreach my $type (@{ $sources->{$source}->{allowed} }) {
				undef $return;
				my $params = { 
						id => $test_id,
						source => $source,
						verbosity => $verbosity,
						type => $type
				};
				eval { $return = $client->get_abundanceprofile_instance( $params ); };
				is ($@, '', "\"$test_name\" call with valid parameter did not return an error.");
				$num_tests++;
				if ($@) {
					print STDERR "Test for \"$test_name\" failed with valid(?) parameters:\n";
					print STDERR Dumper($params);
					print STDERR "Returned structure (if any):\n";
					print STDERR Dumper($@);
					print STDERR Dumper($return);
				}
				elsif ($return) {
					is (ref($return), "HASH", "\"$test_name\" returned a HASH");
					$num_tests++;
					$num_tests += test_result($return, \%attributes, $params);
					
				}
			}
		}
	}


	return $num_tests;
}

sub test_library_query {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_library_instance {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_metagenome_query {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_metagenome_instance {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_project_query {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_project_instance {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_sample_query {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_sample_instance {
	my $client = shift;
	my $num_tests = 0;

        return $num_tests;
}

sub test_sequences_md5 {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_sequences_annotation {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_sequenceset_instance {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

sub test_sequenceset_list {
	my $client = shift;
        my $num_tests = 0;

        return $num_tests;
}

###############################################################################
#----------------------------------------------------------------------------
#
#  Test the returned results
#	1.	Test for an error
#	2.	Test that the returned attribute is expected
#	3.	Test that the returned attribute is the right type
#	4.	If verbosity is 'full' make sure that all of them returned
#

sub test_result
{
	my ($return,$attribute,$test) = @_;
	my $data;

	my $result = $return;
#		print Dumper($result);  

	if (ref($result) eq 'HASH' && exists ($result->{'rows'}) )
	{	#print "DEBUG: Abundanceprofile \n";
		$data->[0] = $result;
	}
	elsif (ref($result) eq 'HASH' && exists ($result->{'data'}))
	{   #print "DEBUG: Sample/Library/Metagenome/Project query \n";
		$data->[0] = $result->{data};
	}  
	elsif (ref($result) eq 'HASH')
	{   #print "DEBUG: Sample/Library/Metagenome/Project instance \n";
		$data->[0] = $result;
	} 
	elsif (ref($result) eq 'ARRAY')
	{	#print "DEBUG: Sample/Library/Metagenome/Project/Sequences_MD5 instance  \n";
#		print Dumper($result);  
		$data = $return;
		die "never should reached this point" ;
	}
	else
	{	print "DEBUG: UNKNOWN  \n";
		$data = $return;
	}

#	my $result = $return->{'result'};
#		print Dumper($data);  
#return;

#	if (ref($result) eq 'HASH' && exists ($return->{'result'}->{'rows'}) )
#	{	#print "DEBUG: Abundanceprofile \n";
#		$data->[0] = $return->{'result'};
#	}
#	elsif (ref($result) eq 'HASH')
#	{   #print "DEBUG: Sample/Library/Metagenome/Project query \n";
#		$data = $return->{'result'}->{'data'};
#	}  
#	elsif (ref($result) eq 'ARRAY')
#	{	#print "DEBUG: Sample/Library/Metagenome/Project/Sequences_MD5 instance  \n";
#		$data = $return->{'result'};
#	}
#	else
#	{	print "DEBUG: UNKNOWN  \n";
#		$data = $return;
#	}

	my %attributes = %$attribute;
	my %test_value = %$test;
	my %found_att;
	my $count = 0;

	if (ref($data) eq 'ARRAY')
	{
		foreach my $key3 (@$data)
		{
			if (ref($key3) eq 'HASH')
			{
				foreach my $key4 (keys(%$key3))
				{
					#print "\t\t\tKEY=$key4 VALUE=$key3->{$key4} \n";
					#print Dumper \%attributes ;
					ok(exists $attributes{$key4}, "Is Attribute $key4 valid?");
					if (exists $attributes{$key4} && $attributes{$key4} eq 'M'  )
					{
						is (ref($key3->{$key4}),'HASH', "Is Attribute $key4 a hash?");
					}
					elsif (exists $attributes{$key4} && $attributes{$key4} eq 'L'  )
					{
						is (ref($key3->{$key4}),'ARRAY', "Is Attribute $key4 an array?");
					}
					else
					{
						is (ref($key3->{$key4}),'', "Is Attribute $key4 a scalar?");
					}
					$found_att{$key4} = 'Y';
				}
			}
			$count++;
		}
	}

	if (exists $test_value{'verbosity'} && $test_value{'verbosity'} eq 'full')
	{
		note"Verbosity=FULL, Were all Attributes returned?";
		foreach my $key(keys(%attributes))
		{
			ok(exists $found_att{$key}, "Was attribute $key found?");
		}
	}

	return if (ref($result) eq 'ARRAY');

	is ($result->{'limit'},$test_value{"limit"}, "Is the returned limit the same as the requested limit?") if (exists $test_value{"limit"});
	is ($count, $test_value{"limit"}, "Is the returned number of records the same as the requested limit?") if (exists $test_value{"limit"});
	is ($result->{'offset'},$test_value{"offset"}, "Is the returned offset the same as the requested offset?") if (exists $test_value{"offset"});
	is ($result->{'order'},$test_value{"order"}, "Is the returned order the same as the requested order?") if (exists $test_value{"order"});

#	is ($return->{'result'}->{'limit'},$test_value{"limit"}, "Is the returned limit the same as the requested limit?") if (exists $test_value{"limit"});
#	is ($count, $test_value{"limit"}, "Is the returned number of records the same as the requested limit?") if (exists $test_value{"limit"});
#	is ($return->{'result'}->{'offset'},$test_value{"offset"}, "Is the returned offset the same as the requested offset?") if (exists $test_value{"offset"});
#	is ($return->{'result'}->{'order'},$test_value{"order"}, "Is the returned order the same as the requested order?") if (exists $test_value{"order"});


}

sub test_error
{
	my ($return,$test) = @_;
	my %test_value = %$test;

	if (exists $return->{'error'})
	{
		print "\tRETURN ERROR\n";
		foreach my $key (keys(%{$return->{'error'}->{'data'}}))
		{
			print "\t$return->{'error'}->{'data'}->{$key} \n";
		}
 		print "\tRETURN PARAMETERS: ";
		foreach my $key (keys(%test_value))
		{
			print "$key=$test_value{$key}  ";
		}
		print "\n";
		print "\tCODE=".$return->{'error'}->{'code'}."\n";
		print "\tMESSAGE=".$return->{'error'}->{'message'}."\n";
#		print Dumper($return);  
		ok( ! exists ($return->{'error'}->{'data'}),"Is the HASH free of errors");
		return;
	}
	else
	{
		ok( ! exists ($return->{'error'}->{'data'}),"Is the HASH free of errors");
	}

}





#my $result;

#eval{ $result = $client->get_abundanceprofile_instance({ 'id' => 'mgm4440026.3', 'type' => 'organism', 'source' => 'M5RNA', 'verbosity' => 'minimal'}); };

#if ($@) { print Dumper($@); }
#else { print Dumper($result); }
