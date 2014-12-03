#!/usr/bin/perl -w
use strict;
use warnings;
use lib "test/script-tests/";

use Data::Dumper;
use Test::More 'no_plan';
use JSON;

# script to test
my $script = "mg-get-metagenome" ;

# assumption scripts are always in path
my $topDir = $ENV{KB_TOP_DIR} || "/";
my $service_repo = "communities_api" ;
my $script_path = $topDir . "" ;
my $num_tests   = 0;
my $json        = new JSON;
my $success     = 1;
my $test_data_path = shift @ARGV || join "/" , $topDir , "dev_container/modules" , $service_repo , "test/data" ;

#my $test_path = "/Users/Andi/Development/kbase/communities_api/scripts" ;

print STDERR "Test data path: $test_data_path\n" ;


# test if script is in path
ok (`which $script` , "$script is deployed") ;
ok (`$script --help`, "$script executes with --help") ;

# test if script can retrieve data for ids from test list 
# changing parameters are:
# - verbosity : ["minimal", "mixs",  "metadata",  "stats",  "full"]




open(IDs , "$test_data_path/ids.wgs.txt") or die "No test data file $test_data_path/ids.wgs.txt\n" ;

while (my $id = <IDs>){
	chomp $id ;
	
	foreach my $verbosity ("minimal", "mixs",  "metadata",  "stats",  "full") {
		ok(get_data($verbosity) , "Success for id $id and value $verbosity") ;
	}
	
}

close(IDs);



sub get_data{
	my ($id, $value) = @_ ;
	return system("$script --id $id --verbosity $value > $test_data_path/out.tmp") ;
}
