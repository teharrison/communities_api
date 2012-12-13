package CommunitiesAPIServer;

use Data::Dumper;
use Moose;

extends 'RPC::Any::Server::JSONRPC::PSGI';

has 'instance_dispatch' => (is => 'ro', isa => 'HashRef');
has 'user_auth' => (is => 'ro', isa => 'UserAuth');
has 'valid_methods' => (is => 'ro', isa => 'HashRef', lazy => 1,
			builder => '_build_valid_methods');

our $CallContext;

our %return_counts = (
        'get_abundanceprofile_instance' => 1,
        'get_analysisset_instance' => 1,
        'get_analysisset_setlist' => 1,
        'get_library_query' => 1,
        'get_library_instance' => 1,
        'get_matrix_organism' => 1,
        'get_matrix_function' => 1,
        'get_metagenome_query' => 1,
        'get_metagenome_instance' => 1,
        'get_metagenome_statistics_instance' => 1,
        'get_project_query' => 1,
        'get_project_instance' => 1,
        'get_sample_query' => 1,
        'get_sample_instance' => 1,
        'get_sequences_md5' => 1,
        'get_sequences_annotation' => 1,
        'get_sequenceset_instance' => 1,
        'get_sequenceset_setlist' => 1,
        'version' => 1,
);

sub _build_valid_methods
{
    my($self) = @_;
    my $methods = {
        'get_abundanceprofile_instance' => 1,
        'get_analysisset_instance' => 1,
        'get_analysisset_setlist' => 1,
        'get_library_query' => 1,
        'get_library_instance' => 1,
        'get_matrix_organism' => 1,
        'get_matrix_function' => 1,
        'get_metagenome_query' => 1,
        'get_metagenome_instance' => 1,
        'get_metagenome_statistics_instance' => 1,
        'get_project_query' => 1,
        'get_project_instance' => 1,
        'get_sample_query' => 1,
        'get_sample_instance' => 1,
        'get_sequences_md5' => 1,
        'get_sequences_annotation' => 1,
        'get_sequenceset_instance' => 1,
        'get_sequenceset_setlist' => 1,
        'version' => 1,
    };
    return $methods;
}

sub call_method {
    my ($self, $data, $method_info) = @_;
    my ($module, $method) = @$method_info{qw(module method)};
    
    my $ctx = CommunitiesAPIServerContext->new(client_ip => $self->_plack_req->address);
    
    my $args = $data->{arguments};

        # Service CommunitiesAPI does not require authentication.
        
    my $new_isa = $self->get_package_isa($module);
    no strict 'refs';
    local @{"${module}::ISA"} = @$new_isa;
    local $CallContext = $ctx;
    my @result;
    {
	my $err;
	eval {
	    @result = $module->$method(@{ $data->{arguments} });
	};
	if ($@)
	{
	    #
	    # Reraise the string version of the exception because
	    # the RPC lib can't handle exception objects (yet).
	    #
	    my $err = $@;
	    my $str = "$err";
	    $str =~ s/Bio::KBase::CDMI::Service::call_method.*//s;
	    $str =~ s/^/>\t/mg;
	    die "The JSONRPC server invocation of the method \"$method\" failed with the following error:\n" . $str;
	}
    }
    my $result;
    if ($return_counts{$method} == 1)
    {
        $result = [[$result[0]]];
    }
    else
    {
        $result = \@result;
    }
    return $result;
}


sub get_method
{
    my ($self, $data) = @_;
    
    my $full_name = $data->{method};
    
    $full_name =~ /^(\S+)\.([^\.]+)$/;
    my ($package, $method) = ($1, $2);
    
    if (!$package || !$method) {
	$self->exception('NoSuchMethod',
			 "'$full_name' is not a valid method. It must"
			 . " contain a package name, followed by a period,"
			 . " followed by a method name.");
    }

    if (!$self->valid_methods->{$method})
    {
	$self->exception('NoSuchMethod',
			 "'$method' is not a valid method in service CommunitiesAPI.");
    }
	
    my $inst = $self->instance_dispatch->{$package};
    my $module;
    if ($inst)
    {
	$module = $inst;
    }
    else
    {
	$module = $self->get_module($package);
	if (!$module) {
	    $self->exception('NoSuchMethod',
			     "There is no method package named '$package'.");
	}
	
	Class::MOP::load_class($module);
    }
    
    if (!$module->can($method)) {
	$self->exception('NoSuchMethod',
			 "There is no method named '$method' in the"
			 . " '$package' package.");
    }
    
    return { module => $module, method => $method };
}

package CommunitiesAPIServerContext;

use strict;

=head1 NAME

CommunitiesAPIServerContext

head1 DESCRIPTION

A KB RPC context contains information about the invoker of this
service. If it is an authenticated service the authenticated user
record is available via $context->user. The client IP address
is available via $context->client_ip.

=cut

use base 'Class::Accessor';

__PACKAGE__->mk_accessors(qw(user client_ip));

sub new
{
    my($class, %opts) = @_;
    
    my $self = {
	%opts,
    };
    return bless $self, $class;
}

1;
