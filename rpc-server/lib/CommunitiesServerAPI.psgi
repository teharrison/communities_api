use CommunitiesServerAPIImpl;
use CommunitiesServerAPIServer;



my $impl_obj = CommunitiesServerAPIImpl->new;

my $server = CommunitiesServerAPIServer->new(instance_dispatch => { 'CommunitiesServerAPI' => $impl_obj },

				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler;
