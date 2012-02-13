
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
my $force   = 0  ;
my $resource = 'project';
my $id       = '';
my $url      = '';
my $destination = "./" ;

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
	    'param=s@'      => \@params,
	    'destination=s'=> \$destination ,
    );




# initialize JASON OO-interface
my $json = JSON->new->allow_nonref;

my $ua = LWP::UserAgent->new;
$ua->agent("MGRAST/0.1 ");



my $c = Communities->new ;
$c->base_url($url) if ($url and $url =~/^http/);

my $data = 'no results';


$data = $c->request('metagenome' , $id , '' , \@params) ;


my $projects    = { fields  => {} ,
		    ids     => {} ,
		    project => [] , 
		  } ;
my $libraries   = { fields  => {} ,
		    library => [] ,
		  } ;
my $samples     = { fields => {} ,
		    sample => [] ,
		  } ;

my $pid = 0 ;
my $sid = 0 ;
my $lid = 0 ;


# open FILES

open (P , ">".$destination."/project.mapping" ) or die "Can't open $destination/project.mapping for writing!";
open (PS , ">".$destination."/project_sample.mapping" ) or die "Can't open $destination/project_sample.mapping for writing!";
open (SL , ">".$destination."/sample_library.mapping" ) or die "Can't open $destination/sample_library.mapping for writing!";

open (PMD , ">".$destination."/project.metadata") or die "Can't open $destination/project.metadata for witing!";
open (SMD , ">".$destination."/sample.metadata") or die "Can't open $destination/sample.metadata for witing!";
open (LMD , ">".$destination."/library.metadata") or die "Can't open $destination/library.metadata for witing!";




foreach my $record (@$data){
  
  my $mg = $c->request('metagenome' , "mgm".$record->{id} , '' , \@params) ;



  # read project
  my $project = { id       => $mg->{project} , # don't forget to override
		  metadata => {} ,
		  type     => 'project',
		} ;
  
  unless ( $mg->{ project } and defined $projects->{ ids }->{ $mg->{ project } } and  $projects->{ ids }->{ $mg->{ project } } ){
    if ( $mg->{project} ){
      
      # get project data 
      my $prj = $c->request('project' , $mg->{project} , '' , \@params) ;
      

      next unless ($prj and ref $prj) ;
      # remember metadata fields
      $prj = $project unless ref $prj ;
      foreach my $tag (keys %{ $prj->{metadata} } ) {
	#print join "\t" , $tag , $prj->{metadata}->{$tag} ,  "\n";
	$projects->{ fields }->{ $tag }++; 
      }
      $project->{ id }       = $mg->{project}   ;
      $project->{ metadata } = $prj->{metadata} ;
    }
    else{
      $project->{ id } = "p".$pid ;
      $pid++;
    }
    # store metadata 
    $projects->{ids}->{$project->{id} }++;
    push @{ $projects->{project} } ,  $project ;
    
    print P $project->{id} , "\n";
    map { print PMD join "\t" , $project->{id} , $_ , $project->{metadata}->{$_} , "\n" } keys %{$project->{metadata}} if ref $project->{metadata};
  }
 
  
  # read sample
  my $sample = {  id       => '' ,
		  project  => $project->{id} ,
		  metadata => {} ,
		  type     => 'sample',	
	       } ;

  if ( $mg->{sample} ){
    my $sam = $c->request('sample' , $mg->{sample} , '' , \@params) ;
    #print Dumper $sam;
    #exit;
    $sam = $sample unless ref $sam ;
    foreach my $tag (keys %{ $sam->{metadata} } ) {
      #print join "\t" , $tag , $sam->{metadata}->{$tag} ,  "\n";
      $samples->{ fields }->{ $tag }++; 
    }

    $sample->{ id }       = $mg->{sample}   ;
    $sample->{ metadata } = $sam->{metadata} ;
  }
  else{
    $sample->{ id } = $project->{ id } . $sample->{ id } ."s".$sid ;
    $sid++;
  }
  
  push @{ $samples->{sample} } , $sample ;
  
  print PS join "\t" , $project->{id} , $sample->{id} , "\n";
  map { print SMD join "\t" ,  $project->{id} , $sample->{id} , $_ ,  $sample->{metadata}->{$_} , "\n" } keys %{$sample->{metadata}} if ref $sample->{metadata};


 # Read library
  my $library = {  id         => '' ,
		   project    => $project->{id} ,
		   sample     => $sample->{id},
		   metagenome => $mg->{id},
		   metadata   => {} ,
		   type       => 'library',
		};
  
  
  if ( $mg->{library} ){
    my $lib = $c->request('library' , $mg->{library} , '' , \@params) ;
    #print Dumper $lib;
    #exit;
    
    unless (ref $lib) {
      print Dumper $mg;
      print Dumper $lib;
      print Dumper $record;
    };

    $lib = $library unless ref $lib ;
    foreach my $tag (keys %{ $lib->{metadata} } ) {
      #print join "\t" , $tag , $lib->{metadata}->{$tag} ,  "\n";
      $libraries->{ fields }->{ $tag }++; 
    }
    $library->{ id }       = $mg->{library}   ;
    $library->{ metadata } = $lib->{metadata} ;
  }
  else{
    $library->{ id } = $sample->{id}."l".$lid ;
    $lid++;
  }
  
  push @{ $libraries->{library} } , $library ;

  print SL join "\t" ,  $project->{id} , $sample->{id} , $library->{id} , "\n";
  map { print LMD join "\t" ,  $project->{id} , $sample->{id} , $library->{id} , $_ ,  $library->{metadata}->{$_} , "\n" } keys %{$library->{metadata}} if ref $library->{metadata} ;


  print  join "\t" ,  $record->{id} , $record->{sample} , "\n" if ( $record->{sample} );
  
}










  
  
  
