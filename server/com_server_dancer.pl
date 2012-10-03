# make this script a webapp
use Dancer;
set serializer => 'JSON';
use CGI;
#use JSON;
use Data::Dumper ;


# appdir/environments/development.yml
# log: 'debug'
# startup_info: 1
# show_errors:  1

# create cgi and json objects
my $cgi = new CGI;
my $json = new JSON;
#$json = $json->utf8();

my $resource_path = "/Users/Andi/Development/kbase/communities_api/server/lib" ;
my $resources;
my $resources_hash = {} ;

if (opendir(my $dh, $resource_path)) {
    my @res = grep { -f "$resource_path/$_" } readdir($dh);
    closedir $dh;
    @$resources = map { my ($r) = $_ =~ /^(.*)\.pm$/; $r; } @res;
    %$resources_hash = map { $_ => 1 } @$resources;
}

# declare routes/actions
get '/' => sub {
    my $params = shift;
    print STDERR Dumper $params ;

    request->params; # request, params parsed as a hash ref
    request->body; # returns the request body, unparsed
    request->path; # the path requested by the client

    my $resource_objects;
    foreach my $resource (@$resources) {
	push(@$resource_objects, { 'name' => $resource, 'url' => $cgi->url.'/'.$resource});
    }
    #print $cgi->header(-type => 'application/json',
#		       -status => 200,
#		       -Access_Control_Allow_Origin => '*' );
    my $content = { id => 'KBASE',
		    documentation => 'http://kbase.us',
		    contact => 'TBA',
		    resources => $resource_objects,
		    url => $cgi->url."/" ,
		    path => request->path ,
		    tmp => params,

		  };
    # return $json->encode($content);
    $content ;
};



get '/hello/:name' => sub {


    "Hello ".param('name');
    request->path ;
};
 

get qr{/([^/]+)} => sub {
  "Pups"
};


get qr{/([^\/\s]+)\/([^\/]+)} => sub {
  my ($resource , $id) = splat ;
  my %allparams = params;

  my @rest_parameters = split "/" , request->path ;
  my $cgi_parameters = request->params ;

  my $query = "use resources::$resource; resources::".$resource."::request( { 'rest_parameters' => \\\@rest_parameters, 'cgi_parameters' => \$cgi_parameters, 'request_method' => \$request_method, 'request_body' => \$request_body, 'user' => \$user } );";
  eval $query;



  return $query if ($query);

  return { 
	  #"list" => [ $presource , $id ] , 
	  "ID" => $id ,
	  "params" => \%allparams ,
	  "a" => request->params, # request, params parsed as a hash ref
	  "b" => request->body,  # returns the request body, unparsed
	  "c" => request->path, # the path requested by the client
	 }
};

# run the webserver
Dancer->dance;



sub TO_JSON { return { %{ shift() } }; }
