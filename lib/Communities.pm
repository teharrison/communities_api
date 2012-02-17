package Communities ;

use strict;
use warnings;

use JSON;
use Data::Dumper;

use Communities::Project ;
use Communities::Sample ;
use Communities::Library ;

sub new{
my ($class) = @_ ;

# initialize JASON OO-interface
my $json = JSON->new->allow_nonref;

my $c = {
	 base_url  => "http://communities.api.kbase.us" ,
	 method    => '' , # only getter , need to get set when using HTTP methods and not curl
	 json      => $json ,
	 auth      => '' ,
	};

bless $c;
return $c; 
}


# return base url 
sub base_url {
  my ($c , $url) = @_;
  $c->{base_url} = $url if ($url);
  return $c->{base_url};
}

# get json object handler
sub json{
  my ($c) = @_;
  return $c->{json} ;
}

sub method {
  my ($c , $method) = @_;
  return $c->{ method } ;
}

sub request {
  my ($c, $resource , $id , $query , $params ) = @_ ;

  # build request
  my $request = $c->base_url . "/$resource";
  #print Dumper $params ;
  # build parameter string
  my $param = '' ;
  if ($params and ref $params and scalar @$params){
   
    foreach my $p (@$params){
      $param .= "&" if ($param);
      $param .= $p ;
    }
    $param = "-d \"$param\"" ;
  }

  #add ID if provided and check for data 
  if ($id){
    $request .= "/$id" if ($id);
    
    
    my $content = `curl --silent --head $request $param` ;
    
    return 0 if ($content =~/HTTP\/1\.1 404 Not Found/) ;
  }
  elsif($query){
    # add query url if ID is not present
    $request .= "/query/$query" ;
  }
  
  # get data
  #print  "curl --silent --compressed $request $param\n";
  my $content = `curl --silent --compressed $request $param` ;

  # build perl data structure

  #print Dumper $content ;
  
  my $data = 0 ;
  if ($content =~ /ERROR/) {
    print STDERR "ERROR:\t" , $content , "\n";
  }
  else{
    eval
      {
	$data  = $c->json->decode( $content );
      };
    if ($@) {
      warn "Unable to decode string: $@\n";
      $data = {} ; 
    }
  }
  return $data ;
}

sub query {
  my ($c , $resource , $attributes) = @_ ;
  
  my $query = join "/" , ( map { ( $_ , $attributes->{$_} ) } keys %$attributes ) ;
  return $c->request($resource , '' , $query)
}

sub project {
  my ($c , $id , $q) = @_;
  
  if ($id){
    my $data =  $c->request('project' , $id) ;
    if ($data){
      print Dumper $data  ;
      return Communities::Project->new($data) ;
    }
    
    
  }
  elsif($q and ref $q){}
  else{
    return $c->request('project') ;
  }
  
  return 0 ;
}

sub sample {
  my ($c , $id , $q) = @_;
  
  if ($id){
    my $data =  $c->request('Sample' , $id) ;
    if ($data){
      print Dumper $data  ;
      return Communities::Sample->new($data) ;
    }
    
    
  }
  elsif($q and ref $q){}
  else{
    return $c->request('Sample') ;
  }
  
  return 0 ;
}


sub library {
  my ($c , $id , $q) = @_;
  
  if ($id){
    my $data =  $c->request('Library' , $id) ;
    if ($data){
      print Dumper $data  ;
      return Communities::Library->new($data) ;
    }
    
    
  }
  elsif($q and ref $q){}
  else{
    return $c->request('Libary') ;
  }
  
  return 0 ;
}

# json helper function 
sub TO_JSON { return { %{ shift() } }; }

1;
