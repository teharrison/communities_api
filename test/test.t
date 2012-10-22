use strict;
use warnings;

use Test::More tests => 52;
use rpc_client;

my	$HOST='http://api.metagenomics.anl.gov/api2.cgi';
my $object = rpc_client->new({ "url" => $HOST } ); # create a new object with the URL

my $return;
my %test_value;

note"TEST get_sample_query";

$test_value{"limit"} = 2;
$test_value{"offset"} = 56;
$test_value{"order"}='name'; 

eval { $return = $object->get_sample_query(\%test_value)  };
is($@, '', "Call with valid parameters works $@");
is(ref $return, "HASH", "Call with valid parameters works $@");

foreach my $key1 (keys(%$return))
{
	my $value = $return->{$key1};
	if (ref($value) eq 'HASH')
	{
		print "KEY=$key1\n";
		foreach my $key2 (keys(%$value))
		{
			print "\tKEY=$key2 VALUE=$value->{$key2}\n";
		}
	}
	else
	{ 
		print "KEY=$key1 VALUE=$return->{$key1}\n";
	}
}
