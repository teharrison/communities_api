package rpc_client;

use strict;
use warnings;

use JSON;
use LWP::UserAgent;
use Encode;

sub new {
  my ($class, $params) = @_;

  unless ($params->{url}) {
    warn "invalid invocation of rpc_client, required parameter url missing";
    return undef;
  }

  my $json = new JSON;
  my $ua = LWP::UserAgent->new;

  my $self = { url => $params->{url},
	       version => 1,
	       methods => [],
	       _json => $json,
	       _ua => $ua,
	       _valid_methods => { version => 1 } };

  my $response = $ua->get($self->{url})->content;
  my $data;

  eval {
    $data = $json->decode($response);
  };
  if ($@) {
    warn "could not connect to server: $response";
    return undef;
  }

  unless ($data->{resources}) {
    warn "server response has invalid format";
    return undef;
  }

  foreach my $resource (@{$data->{resources}}) {
    my $response = $ua->get($resource->{url})->content;
    my $retval;
    eval {
      $retval = $json->decode($response);
    };
    if ($@) {
      warn "invalid response from server for ".$resource->{name}." methods: $response";
      return undef;
    }

    foreach my $request (@{$retval->{requests}}) {
      my $method = { name => "get_".$retval->{name}."_".$request->{name},
		     description => $retval->{description}.". ".$request->{description},
		     optional_parameters => $request->{options},
		     required_parameters => $request->{required} };
      push(@{$self->{methods}}, $method);
      $self->{_valid_methods}->{$method->{name}} = $retval->{name};
    }
  }

  bless $self, $class;

  return $self;
}

sub methods {
  my ($self) = @_;

  unless (ref $self) {
    die "rpc_client::methods must be called as a class method";
  }

  return $self->{methods};
}

sub AUTOLOAD {
  my ($self, $params) = @_;
  
  unless (ref $self) {
    die "Not called as an object method.";
  }

  # assemble method call from AUTOLOAD call
  my $call = our $AUTOLOAD;
  return if $AUTOLOAD =~ /::DESTROY$/;
  $call =~ s/.*://;  

  # check if the server supports the method $call
  if ($self->{_valid_methods}->{$call}) {

    my $data = { jsonrpc => "2.0",
		 method => $call,
		 params => $params,
		 id => int(rand(1000)) };
    $data = $self->{_json}->encode($data);
    
    my $response = $self->{_ua}->post($self->{url}, 'Content-type' => 'application/json', 'Content-length' => length($data), 'Accept' => 'application/json', Content => encode("iso-8859-1", $data))->content;
    my $retval;
    eval {
      $retval = $self->{_json}->decode($response);
    };
    if ($@) {
      warn "the method call could not be processed: $response";
      return undef;
    } else {
      return $retval;
    }
		       
  } else {
    warn "This server does not support the method '$call'.";
    return undef;
  }
}

sub can {
  my ($self, $method) = @_;

  if ($self->{_valid_methods}->{$method}) {
    return 1;
  } else {
    return 0;
  }
}

sub version {
  my ($self) = @_;

  return $self->{version};
}

sub TO_JSON { return { %{ shift() } }; }

1;
