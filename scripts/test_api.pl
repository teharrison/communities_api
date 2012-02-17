
use strict ;
use warnings;
use Data::Dumper;
use JSON; # imports encode_json, decode_json, to_json and from_json.
use LWP::UserAgent ;
use HTTP::Request::Common;

use Getopt::Long;
use File::Copy;

use Communities ;

my $method  = '' ;
my $key     = '' ;
my $service = '' ; 
my $file    = '' ;
my $project = '' ;
my $pid     = '' ; 
my $force   = 0  ;
my $resource = 'project';
my $id       = '';
my $url      = '';
my $object   = 0 ;
my @params;
my %query;

GetOptions (	
	    'key=s'        => \$key ,
	    'method=s'     => \$method ,
	    'force'        => \$force ,
	    'id=s'         => \$id ,
	    'resource=s'   => \$resource,
	    'url=s'        => \$url,
	    'query=s'      => \%query,
	    'param=s@'     => \@params,
	    'object'       => \$object,
    );




# initialize JSON OO-interface
my $json = JSON->new->allow_nonref;

my $ua = LWP::UserAgent->new;
$ua->agent("KBASE/0.1 ");


print Dumper @params ;


my $c = Communities->new ;
$c->base_url($url) if ($url and $url =~/^http/);

my $data = 'no results';

if( keys %query){
  print "Here\n";
  exit;
  $data = $c->query($resource , \%query , \@params) ;
}
else{
  if ($object){
    
    if($resource eq 'Project'){ $data = $c->project($id) }
    elsif($resource eq 'Libary'){ $data = $c->library($id) }
    elsif($resource eq 'Sample'){ $data = $c->sample($id) }

  }
  else{
    $data = $c->request($resource , $id , '' , \@params);
  }
}

unless($data){
  print STDERR "No data available for $resource $id!\n";
  exit 0;
}


print Dumper $data ;





# TEST Functions

sub test_data_one{
  my ($data) = @_ ;
  foreach my $prj_id (@{$data->{projects}}){
    print "$prj_id\n" ;
    next if ($prj_id < 75);
    
    my $prj = $c->request('project' , $prj_id) ;
    #my $prj = shift @$data ;
    print join "\t" , $prj->{id} , $prj->{type} , ($prj->{samples} ? scalar @{$prj->{samples} }: '0') , ($prj->{library} || '0') , (ref $prj->{analyzed} ? ( scalar @{$prj->{analyzed}} , shift @{$prj->{analyzed}}):  '0') ,"\n";
    
    if ( @{$prj->{analyzed}} ){
      
      foreach my $sid (@{$prj->{samples}} ){
	my $sample = $c->request('sample' , $sid) ;
	
	# unless(ref $data){
	#   print STDERR "No metagenome for\t$mgid\n" ;
	#   next;
	# }
	
	# my $mg = shift @$data ;
      if (ref $sample and $sample->{libraries}){
	print join "\t" , "Library" , ($sample->{libraries} ? scalar @{$sample->{libraries} } : 'missing') , "Project" , ($sample->{project} || 'missing') , "\n";
	#print STDERR Dumper $sample ;
	#exit;
	
	if ($sample->{libraries} and ref $sample->{libraries}){
	  print "Found\n" , Dumper $sample->{libraries} ;
	  foreach my $lid (@{$sample->{libraries}}){
	    my $l = $c->request('library' , $lid) ;
	    
	    next unless $l->{reads} ;
	    
	    print Dumper $l ;
	    print Dumper $prj ;
	    print join "\t" , $prj_id , $sid , $lid , $l->{reads} , "\n"; 
	    exit;
	  }
	}
	
      }
	elsif( ! ref $sample){
	  print STDERR "Error(2): $sample\t$sid\n" , Dumper $prj ;
	  exit;
	}
	
      }
      
    }
  }
  
  
  #print  $c->project(93) ;
  
  exit;
}
  
  
  
