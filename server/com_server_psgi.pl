use HTTP::Server::Simple::PSGI;
use Plack::App::URLMap;
use strict;
use warnings;

# Template

my $app = sub {
  my $env = shift;
  my $status = 404;
  return [ $status,[], [] ];


};

my $app1 = sub {

  my $env = shift;
  my $status = 200;
  my $headers = ["Content-Type" => "text/plain" ];
  my $body = ["Hello from app1"];
  return [ $status, $headers, $body ];

};

my $app2 = sub {
use CGI::PSGI;
    my $env = shift;
    my $query = CGI::PSGI->new($env);
    #    return [ 200, 
    #             [ "Content-Type" => "text/plain" ],
    #             [ "Hello ", $query->param('name') ]
    #           ];
    return [ 
             $query->psgi_header('text/plain'), 
             [ "Hello ", $query->param('name') ]
           ];
};


my $urlmap = Plack::App::URLMap->new();
$urlmap->map("/" => $app);
$urlmap->map("/app1" => $app1);
$urlmap->map("/app2" => $app2);
my $app_map = $urlmap->to_app();

my $port = 21001;
my $server = HTTP::Server::Simple::PSGI->new($port);
$server->host($host);
$server->app($app_map);
$server->run;














