package resources::subsystemclass;

use CGI;
use JSON;

use LWP::UserAgent;

my $cgi = new CGI;
my $json = new JSON;
$json = $json->utf8();

sub about {
  my $content = { 'description' => "Subsystem classes impose a hierarchical organization on the
subsystems.
It has the following fields:

=over 4



=back


",
		  'parameters' => { "id" => "string" },
		  'return_type' => "application/json" };

  print $cgi->header(-type => 'application/json',
		     -status => 200,
		     -Access_Control_Allow_Origin => '*' );
  print $json->encode($content);
  exit 0;
}

sub request {
  my ($params) = @_;

  my $rest = $params->{rest_parameters};
  my $cgiparams = $params->{cgi_parameters};

  if (exists $cgiparams->{'about'}) {
    &about();
    exit 0;
  }

  my $ua = LWP::UserAgent->new;
  my $cdmi_url = "http://bio-data-1.mcs.anl.gov/services/cdmi_api";

  if (exists $cgiparams->{'verbose'}) {
    my $data = { 'params' => [ 0, 1000000, [ "id" ] ],
		  'method' => 'CDMI_EntityAPI.all_entities_SubsystemClass',
		  'version' => "1.1" };
    
    my $response = $json->decode($ua->post($cdmi_url, Content => $json->encode($data))->content);
    $response = $response->{result};
    
    my $subsystemclass_list = [];
    foreach my $key (keys(%{$response->[0]})) {
      push(@$subsystemclass_list, $response->[0]->{$key});
    }
    
    print $cgi->header(-type => 'application/json',
			-status => 200,
			-Access_Control_Allow_Origin => '*' );
    
    print $json->encode( $subsystemclass_list );
    exit 0;
  }

  if (! $rest || ! scalar(@$rest)) {    
    my $data = { 'params' => [ 0, 1000000, ["id"] ],
		 'method' => 'CDMI_EntityAPI.all_entities_SubsystemClass',
		 'version' => "1.1" };
    
    my $response = $json->decode($ua->post($cdmi_url, Content => $json->encode($data))->content);
    $response = $response->{result};

    my $subsystemclass_list = [];
    @$subsystemclass_list = map { keys(%$_) } @$response;

    print $cgi->header(-type => 'application/json',
		       -status => 200,
		       -Access_Control_Allow_Origin => '*' );
    
    print $json->encode( $subsystemclass_list );
    exit 0;
  }

  if ($rest && scalar(@$rest) == 1) {
    my $data = { 'params' => [ [ $rest->[0] ], [ "id" ] ],
		 'method' => 'CDMI_EntityAPI.get_entity_SubsystemClass',
		 'version' => "1.1" };
    
    my $content = $json->encode($data);
    $content =~ s/%7C/|/g;
    my $response = $json->decode($ua->post($cdmi_url, Content => $content)->content);
    my @k = keys(%{$response->{result}->[0]});
    my $subsystemclass = $response->{result}->[0]->{$k[0]};
    $subsystemclass->{url} = $cgi->url."/subsystemclass/".$rest->[0];

	$data = { 'params' => [ [ $rest->[0] ], [ "id" ], [], [ "id" ] ],
	      'method' => 'CDMI_EntityAPI.get_relationship_IsClassFor',
	      'version' => "1.1" };
    $content = $json->encode($data);
    $content =~ s/%7C/|/g;
    $response = $json->decode($ua->post($cdmi_url, Content => $content)->content);
    $response = $response->{result}->[0];
    my $subsystem_ids = [];
    @$subsystem_ids = map { $_->[2]->{id} } @$response;
    $subsystemclass->{subsystems} = $subsystem_ids;

	$data = { 'params' => [ [ $rest->[0] ], [ "id" ], [], [ "id" ] ],
	      'method' => 'CDMI_EntityAPI.get_relationship_IsSuperclassOf',
	      'version' => "1.1" };
    $content = $json->encode($data);
    $content =~ s/%7C/|/g;
    $response = $json->decode($ua->post($cdmi_url, Content => $content)->content);
    $response = $response->{result}->[0];
    my $subsystemclass_ids = [];
    @$subsystemclass_ids = map { $_->[2]->{id} } @$response;
    $subsystemclass->{subsystemclasss} = $subsystemclass_ids;

	$data = { 'params' => [ [ $rest->[0] ], [ "id" ], [], [ "id" ] ],
	      'method' => 'CDMI_EntityAPI.get_relationship_IsSubclassOf',
	      'version' => "1.1" };
    $content = $json->encode($data);
    $content =~ s/%7C/|/g;
    $response = $json->decode($ua->post($cdmi_url, Content => $content)->content);
    $response = $response->{result}->[0];
    my $subsystemclass_ids = [];
    @$subsystemclass_ids = map { $_->[2]->{id} } @$response;
    $subsystemclass->{subsystemclasss} = $subsystemclass_ids;
    my $out = $json->encode( $subsystemclass );
    $out =~ s/%7C/|/g;

    print $cgi->header(-type => 'application/json',
		       -status => 200,
		       -Access_Control_Allow_Origin => '*' );
    
    print $out;
    exit 0;
  }
}

sub TO_JSON { return { %{ shift() } }; }

1;