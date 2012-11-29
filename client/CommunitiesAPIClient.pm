package CommunitiesAPIClient;

use JSON::RPC::Client;
use strict;
use Data::Dumper;
use URI;
use Bio::KBase::Exceptions;

# Client version should match Impl version
# This is a Semantic Version number,
# http://semver.org
our $VERSION = "0.1.0";

=head1 NAME

CommunitiesAPIClient

=head1 DESCRIPTION


Communities object and resource API

=head2 Synopsis

=head2 Name


=cut

sub new
{
    my($class, $url, @args) = @_;

    my $self = {
	client => CommunitiesAPIClient::RpcClient->new,
	url => $url,
    };


    my $ua = $self->{client}->ua;	 
    my $timeout = $ENV{CDMI_TIMEOUT} || (30 * 60);	 
    $ua->timeout($timeout);
    bless $self, $class;
    #    $self->_validate_version();
    return $self;
}




=head2 get_abundanceprofile_instance

  $return = $obj->get_abundanceprofile_instance($get_abundanceprofile_instance_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_abundanceprofile_instance_params is a get_abundanceprofile_instance_params
$return is an AbundanceprofileInstance
get_abundanceprofile_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	source has a value which is a string
	id has a value which is a string
	type has a value which is a string
AbundanceprofileInstance is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a get_abundanceprofile_instance_rows_object
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a get_abundanceprofile_instance_columns_object
	id has a value which is a string
	type has a value which is a string
	shape has a value which is a reference to a list where each element is an int
get_abundanceprofile_instance_rows_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
get_abundanceprofile_instance_columns_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string

</pre>

=end html

=begin text

$get_abundanceprofile_instance_params is a get_abundanceprofile_instance_params
$return is an AbundanceprofileInstance
get_abundanceprofile_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	source has a value which is a string
	id has a value which is a string
	type has a value which is a string
AbundanceprofileInstance is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a get_abundanceprofile_instance_rows_object
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a get_abundanceprofile_instance_columns_object
	id has a value which is a string
	type has a value which is a string
	shape has a value which is a reference to a list where each element is an int
get_abundanceprofile_instance_rows_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
get_abundanceprofile_instance_columns_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string


=end text

=item Description

A profile in biom format that contains abundance counts
Returns a single data object.

=back

=cut

sub get_abundanceprofile_instance
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_abundanceprofile_instance (received $n, expecting 1)");
    }
    {
	my($get_abundanceprofile_instance_params) = @args;

	my @_bad_arguments;
        (ref($get_abundanceprofile_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_abundanceprofile_instance_params\" (value was \"$get_abundanceprofile_instance_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_abundanceprofile_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_abundanceprofile_instance');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_abundanceprofile_instance",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_abundanceprofile_instance',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_abundanceprofile_instance",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_abundanceprofile_instance',
				       );
    }
}



=head2 get_library_query

  $return = $obj->get_library_query($get_library_query_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_library_query_params is a get_library_query_params
$return is a LibraryQuery
get_library_query_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
LibraryQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a LibraryInstance
	offset has a value which is an int
	total_count has a value which is an int
LibraryInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	sequence_sets has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	metagenome has a value which is a reference to a list where each element is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a reference to a list where each element is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	reads has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

$get_library_query_params is a get_library_query_params
$return is a LibraryQuery
get_library_query_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
LibraryQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a LibraryInstance
	offset has a value which is an int
	total_count has a value which is an int
LibraryInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	sequence_sets has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	metagenome has a value which is a reference to a list where each element is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a reference to a list where each element is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	reads has a value which is a reference to a list where each element is a string


=end text

=item Description

A library of metagenomic samples from some environment
Returns a set of data matching the query criteria.

=back

=cut

sub get_library_query
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_library_query (received $n, expecting 1)");
    }
    {
	my($get_library_query_params) = @args;

	my @_bad_arguments;
        (ref($get_library_query_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_library_query_params\" (value was \"$get_library_query_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_library_query:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_library_query');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_library_query",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_library_query',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_library_query",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_library_query',
				       );
    }
}



=head2 get_library_instance

  $return = $obj->get_library_instance($get_library_instance_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_library_instance_params is a get_library_instance_params
$return is a LibraryInstance
get_library_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
LibraryInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	sequence_sets has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	metagenome has a value which is a reference to a list where each element is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a reference to a list where each element is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	reads has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

$get_library_instance_params is a get_library_instance_params
$return is a LibraryInstance
get_library_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
LibraryInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	sequence_sets has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	metagenome has a value which is a reference to a list where each element is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a reference to a list where each element is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	reads has a value which is a reference to a list where each element is a string


=end text

=item Description

A library of metagenomic samples from some environment
Returns a single data object.

=back

=cut

sub get_library_instance
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_library_instance (received $n, expecting 1)");
    }
    {
	my($get_library_instance_params) = @args;

	my @_bad_arguments;
        (ref($get_library_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_library_instance_params\" (value was \"$get_library_instance_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_library_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_library_instance');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_library_instance",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_library_instance',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_library_instance",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_library_instance',
				       );
    }
}



=head2 get_metagenome_query

  $return = $obj->get_metagenome_query($get_metagenome_query_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_metagenome_query_params is a get_metagenome_query_params
$return is a MetagenomeQuery
get_metagenome_query_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
MetagenomeQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a MetagenomeInstance
	offset has a value which is an int
	total_count has a value which is an int
MetagenomeInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	library has a value which is a reference to a list where each element is a string
	sequence_type has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a reference to a list where each element is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$get_metagenome_query_params is a get_metagenome_query_params
$return is a MetagenomeQuery
get_metagenome_query_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
MetagenomeQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a MetagenomeInstance
	offset has a value which is an int
	total_count has a value which is an int
MetagenomeInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	library has a value which is a reference to a list where each element is a string
	sequence_type has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a reference to a list where each element is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=item Description

A metagenome is an analyzed set sequences from a sample of some environment
Returns a set of data matching the query criteria.

=back

=cut

sub get_metagenome_query
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_metagenome_query (received $n, expecting 1)");
    }
    {
	my($get_metagenome_query_params) = @args;

	my @_bad_arguments;
        (ref($get_metagenome_query_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_metagenome_query_params\" (value was \"$get_metagenome_query_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_metagenome_query:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_metagenome_query');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_metagenome_query",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_metagenome_query',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_metagenome_query",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_metagenome_query',
				       );
    }
}



=head2 get_metagenome_instance

  $return = $obj->get_metagenome_instance($get_metagenome_instance_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_metagenome_instance_params is a get_metagenome_instance_params
$return is a MetagenomeInstance
get_metagenome_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
MetagenomeInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	library has a value which is a reference to a list where each element is a string
	sequence_type has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a reference to a list where each element is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$get_metagenome_instance_params is a get_metagenome_instance_params
$return is a MetagenomeInstance
get_metagenome_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
MetagenomeInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	library has a value which is a reference to a list where each element is a string
	sequence_type has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a reference to a list where each element is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=item Description

A metagenome is an analyzed set sequences from a sample of some environment
Returns a single data object.

=back

=cut

sub get_metagenome_instance
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_metagenome_instance (received $n, expecting 1)");
    }
    {
	my($get_metagenome_instance_params) = @args;

	my @_bad_arguments;
        (ref($get_metagenome_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_metagenome_instance_params\" (value was \"$get_metagenome_instance_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_metagenome_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_metagenome_instance');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_metagenome_instance",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_metagenome_instance',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_metagenome_instance",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_metagenome_instance',
				       );
    }
}



=head2 get_project_query

  $return = $obj->get_project_query($get_project_query_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_project_query_params is a get_project_query_params
$return is a ProjectQuery
get_project_query_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
ProjectQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a ProjectInstance
	offset has a value which is an int
	total_count has a value which is an int
ProjectInstance is a reference to a hash where the following keys are defined:
	analyzed has a value which is a reference to a list where each element is a reference to a list where each element is a string
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
	created has a value which is a string
	samples has a value which is a reference to a list where each element is a reference to a list where each element is a string
	funding_source has a value which is a string
	url has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	pi has a value which is a string

</pre>

=end html

=begin text

$get_project_query_params is a get_project_query_params
$return is a ProjectQuery
get_project_query_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
ProjectQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a ProjectInstance
	offset has a value which is an int
	total_count has a value which is an int
ProjectInstance is a reference to a hash where the following keys are defined:
	analyzed has a value which is a reference to a list where each element is a reference to a list where each element is a string
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
	created has a value which is a string
	samples has a value which is a reference to a list where each element is a reference to a list where each element is a string
	funding_source has a value which is a string
	url has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	pi has a value which is a string


=end text

=item Description

A project is a composition of samples, libraries and metagenomes being analyzed in a global context.
Returns a set of data matching the query criteria.

=back

=cut

sub get_project_query
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_project_query (received $n, expecting 1)");
    }
    {
	my($get_project_query_params) = @args;

	my @_bad_arguments;
        (ref($get_project_query_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_project_query_params\" (value was \"$get_project_query_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_project_query:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_project_query');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_project_query",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_project_query',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_project_query",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_project_query',
				       );
    }
}



=head2 get_project_instance

  $return = $obj->get_project_instance($get_project_instance_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_project_instance_params is a get_project_instance_params
$return is a ProjectInstance
get_project_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
ProjectInstance is a reference to a hash where the following keys are defined:
	analyzed has a value which is a reference to a list where each element is a reference to a list where each element is a string
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
	created has a value which is a string
	samples has a value which is a reference to a list where each element is a reference to a list where each element is a string
	funding_source has a value which is a string
	url has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	pi has a value which is a string

</pre>

=end html

=begin text

$get_project_instance_params is a get_project_instance_params
$return is a ProjectInstance
get_project_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
ProjectInstance is a reference to a hash where the following keys are defined:
	analyzed has a value which is a reference to a list where each element is a reference to a list where each element is a string
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
	created has a value which is a string
	samples has a value which is a reference to a list where each element is a reference to a list where each element is a string
	funding_source has a value which is a string
	url has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	pi has a value which is a string


=end text

=item Description

A project is a composition of samples, libraries and metagenomes being analyzed in a global context.
Returns a single data object.

=back

=cut

sub get_project_instance
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_project_instance (received $n, expecting 1)");
    }
    {
	my($get_project_instance_params) = @args;

	my @_bad_arguments;
        (ref($get_project_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_project_instance_params\" (value was \"$get_project_instance_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_project_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_project_instance');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_project_instance",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_project_instance',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_project_instance",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_project_instance',
				       );
    }
}



=head2 get_sample_query

  $return = $obj->get_sample_query($get_sample_query_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_sample_query_params is a get_sample_query_params
$return is a SampleQuery
get_sample_query_params is a reference to a hash where the following keys are defined:
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
SampleQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a SampleInstance
	offset has a value which is an int
	total_count has a value which is an int
SampleInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	metagenomes has a value which is a reference to a list where each element is a reference to a list where each element is a string
	libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
	created has a value which is a string
	env_package has a value which is a get_sample_instance_env_package_object
	url has a value which is a string
	id has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
get_sample_instance_env_package_object is a reference to a hash where the following keys are defined:
	created has a value which is a string
	name has a value which is a string
	id has a value which is a string
	type has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$get_sample_query_params is a get_sample_query_params
$return is a SampleQuery
get_sample_query_params is a reference to a hash where the following keys are defined:
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
SampleQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a SampleInstance
	offset has a value which is an int
	total_count has a value which is an int
SampleInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	metagenomes has a value which is a reference to a list where each element is a reference to a list where each element is a string
	libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
	created has a value which is a string
	env_package has a value which is a get_sample_instance_env_package_object
	url has a value which is a string
	id has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
get_sample_instance_env_package_object is a reference to a hash where the following keys are defined:
	created has a value which is a string
	name has a value which is a string
	id has a value which is a string
	type has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=item Description

A metagenomic sample from some environment.
Returns a set of data matching the query criteria.

=back

=cut

sub get_sample_query
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_sample_query (received $n, expecting 1)");
    }
    {
	my($get_sample_query_params) = @args;

	my @_bad_arguments;
        (ref($get_sample_query_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_sample_query_params\" (value was \"$get_sample_query_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_sample_query:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_sample_query');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_sample_query",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_sample_query',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_sample_query",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_sample_query',
				       );
    }
}



=head2 get_sample_instance

  $return = $obj->get_sample_instance($get_sample_instance_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_sample_instance_params is a get_sample_instance_params
$return is a SampleInstance
get_sample_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
SampleInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	metagenomes has a value which is a reference to a list where each element is a reference to a list where each element is a string
	libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
	created has a value which is a string
	env_package has a value which is a get_sample_instance_env_package_object
	url has a value which is a string
	id has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
get_sample_instance_env_package_object is a reference to a hash where the following keys are defined:
	created has a value which is a string
	name has a value which is a string
	id has a value which is a string
	type has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$get_sample_instance_params is a get_sample_instance_params
$return is a SampleInstance
get_sample_instance_params is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
SampleInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a reference to a list where each element is a string
	name has a value which is a string
	metagenomes has a value which is a reference to a list where each element is a reference to a list where each element is a string
	libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
	created has a value which is a string
	env_package has a value which is a get_sample_instance_env_package_object
	url has a value which is a string
	id has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
get_sample_instance_env_package_object is a reference to a hash where the following keys are defined:
	created has a value which is a string
	name has a value which is a string
	id has a value which is a string
	type has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=item Description

A metagenomic sample from some environment.
Returns a single data object.

=back

=cut

sub get_sample_instance
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_sample_instance (received $n, expecting 1)");
    }
    {
	my($get_sample_instance_params) = @args;

	my @_bad_arguments;
        (ref($get_sample_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_sample_instance_params\" (value was \"$get_sample_instance_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_sample_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_sample_instance');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_sample_instance",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_sample_instance',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_sample_instance",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_sample_instance',
				       );
    }
}



=head2 get_sequences_md5

  $return = $obj->get_sequences_md5($get_sequences_md5_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_sequences_md5_params is a get_sequences_md5_params
$return is a SequencesMd5
get_sequences_md5_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
	sequence_type has a value which is a string
	md5 has a value which is a reference to a list where each element is a string
SequencesMd5 is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string

</pre>

=end html

=begin text

$get_sequences_md5_params is a get_sequences_md5_params
$return is a SequencesMd5
get_sequences_md5_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
	sequence_type has a value which is a string
	md5 has a value which is a reference to a list where each element is a string
SequencesMd5 is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string


=end text

=item Description

A set of genomic sequences of a metagenome annotated by a specified source that match the given md5 (or all if no md5s are passed).
Returns a single data object.

=back

=cut

sub get_sequences_md5
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_sequences_md5 (received $n, expecting 1)");
    }
    {
	my($get_sequences_md5_params) = @args;

	my @_bad_arguments;
        (ref($get_sequences_md5_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_sequences_md5_params\" (value was \"$get_sequences_md5_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_sequences_md5:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_sequences_md5');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_sequences_md5",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_sequences_md5',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_sequences_md5",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_sequences_md5',
				       );
    }
}



=head2 get_sequences_annotation

  $return = $obj->get_sequences_annotation($get_sequences_annotation_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_sequences_annotation_params is a get_sequences_annotation_params
$return is a SequencesAnnotation
get_sequences_annotation_params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	data_type has a value which is a string
	function has a value which is a reference to a list where each element is a string
	id has a value which is a string
	sequence_type has a value which is a string
	organism has a value which is a string
SequencesAnnotation is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string

</pre>

=end html

=begin text

$get_sequences_annotation_params is a get_sequences_annotation_params
$return is a SequencesAnnotation
get_sequences_annotation_params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	data_type has a value which is a string
	function has a value which is a reference to a list where each element is a string
	id has a value which is a string
	sequence_type has a value which is a string
	organism has a value which is a string
SequencesAnnotation is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string


=end text

=item Description

A set of genomic sequences of a metagenome annotated by a specified source that match the specified annotations (or all if no annotations are passed).
Returns a single data object.

=back

=cut

sub get_sequences_annotation
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_sequences_annotation (received $n, expecting 1)");
    }
    {
	my($get_sequences_annotation_params) = @args;

	my @_bad_arguments;
        (ref($get_sequences_annotation_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_sequences_annotation_params\" (value was \"$get_sequences_annotation_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_sequences_annotation:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_sequences_annotation');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_sequences_annotation",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_sequences_annotation',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_sequences_annotation",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_sequences_annotation',
				       );
    }
}



=head2 get_sequenceset_instance

  $return = $obj->get_sequenceset_instance($get_sequenceset_instance_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_sequenceset_instance_params is a get_sequenceset_instance_params
$return is a SequencesetInstance
get_sequenceset_instance_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
SequencesetInstance is a reference to a hash where the following keys are defined:
	data has a value which is a string

</pre>

=end html

=begin text

$get_sequenceset_instance_params is a get_sequenceset_instance_params
$return is a SequencesetInstance
get_sequenceset_instance_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
SequencesetInstance is a reference to a hash where the following keys are defined:
	data has a value which is a string


=end text

=item Description

A set / subset of genomic sequences of a metagenome from a specific stage in its analysis
Returns a single sequence file.

=back

=cut

sub get_sequenceset_instance
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_sequenceset_instance (received $n, expecting 1)");
    }
    {
	my($get_sequenceset_instance_params) = @args;

	my @_bad_arguments;
        (ref($get_sequenceset_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_sequenceset_instance_params\" (value was \"$get_sequenceset_instance_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_sequenceset_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_sequenceset_instance');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_sequenceset_instance",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_sequenceset_instance',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_sequenceset_instance",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_sequenceset_instance',
				       );
    }
}



=head2 get_sequenceset_list

  $return = $obj->get_sequenceset_list($get_sequenceset_list_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_sequenceset_list_params is a get_sequenceset_list_params
$return is a SequencesetList
get_sequenceset_list_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
SequencesetList is a reference to a hash where the following keys are defined:
	stage_name has a value which is a string
	file_name has a value which is a string
	url has a value which is a string
	id has a value which is a string
	stage_type has a value which is a string
	stage_id has a value which is a string

</pre>

=end html

=begin text

$get_sequenceset_list_params is a get_sequenceset_list_params
$return is a SequencesetList
get_sequenceset_list_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
SequencesetList is a reference to a hash where the following keys are defined:
	stage_name has a value which is a string
	file_name has a value which is a string
	url has a value which is a string
	id has a value which is a string
	stage_type has a value which is a string
	stage_id has a value which is a string


=end text

=item Description

Returns a list of sequenceset objects for the given metagenome.

=back

=cut

sub get_sequenceset_list
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_sequenceset_list (received $n, expecting 1)");
    }
    {
	my($get_sequenceset_list_params) = @args;

	my @_bad_arguments;
        (ref($get_sequenceset_list_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_sequenceset_list_params\" (value was \"$get_sequenceset_list_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_sequenceset_list:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_sequenceset_list');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_sequenceset_list",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_sequenceset_list',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_sequenceset_list",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_sequenceset_list',
				       );
    }
}



sub version {
    my ($self) = @_;
    my $result = $self->{client}->call($self->{url}, {
        method => "CommunitiesAPI.version",
        params => [],
    });
    if ($result) {
        if ($result->is_error) {
            Bio::KBase::Exceptions::JSONRPC->throw(
                error => $result->error_message,
                code => $result->content->{code},
                method_name => 'get_sequenceset_list',
            );
        } else {
            return wantarray ? @{$result->result} : $result->result->[0];
        }
    } else {
        Bio::KBase::Exceptions::HTTP->throw(
            error => "Error invoking method get_sequenceset_list",
            status_line => $self->{client}->status_line,
            method_name => 'get_sequenceset_list',
        );
    }
}

sub _validate_version {
    my ($self) = @_;
    my $svr_version = $self->version();
    my $client_version = $VERSION;
    my ($cMajor, $cMinor) = split(/\./, $client_version);
    my ($sMajor, $sMinor) = split(/\./, $svr_version);
    if ($sMajor != $cMajor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Major version numbers differ.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor < $cMinor) {
        Bio::KBase::Exceptions::ClientServerIncompatible->throw(
            error => "Client minor version greater than Server minor version.",
            server_version => $svr_version,
            client_version => $client_version
        );
    }
    if ($sMinor > $cMinor) {
        warn "New client version available for CommunitiesAPIClient\n";
    }
    if ($sMajor == 0) {
        warn "CommunitiesAPIClient version is $svr_version. API subject to change.\n";
    }
}

=head1 TYPES



=head2 get_sample_instance_env_package_object

=over 4



=item Description

key value pairs describing metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
created has a value which is a string
name has a value which is a string
id has a value which is a string
type has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
created has a value which is a string
name has a value which is a string
id has a value which is a string
type has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 SampleInstance

=over 4



=item Description

key value pairs describing metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a reference to a list where each element is a string
name has a value which is a string
metagenomes has a value which is a reference to a list where each element is a reference to a list where each element is a string
libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
created has a value which is a string
env_package has a value which is a get_sample_instance_env_package_object
url has a value which is a string
id has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a reference to a list where each element is a string
name has a value which is a string
metagenomes has a value which is a reference to a list where each element is a reference to a list where each element is a string
libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
created has a value which is a string
env_package has a value which is a get_sample_instance_env_package_object
url has a value which is a string
id has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 ProjectInstance

=over 4



=item Description

the first and last name of the principal investigator of the project


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
analyzed has a value which is a reference to a list where each element is a reference to a list where each element is a string
version has a value which is an int
name has a value which is a string
description has a value which is a string
libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
created has a value which is a string
samples has a value which is a reference to a list where each element is a reference to a list where each element is a string
funding_source has a value which is a string
url has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
pi has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
analyzed has a value which is a reference to a list where each element is a reference to a list where each element is a string
version has a value which is an int
name has a value which is a string
description has a value which is a string
libraries has a value which is a reference to a list where each element is a reference to a list where each element is a string
created has a value which is a string
samples has a value which is a reference to a list where each element is a reference to a list where each element is a string
funding_source has a value which is a string
url has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
pi has a value which is a string


=end text

=back



=head2 MetagenomeInstance

=over 4



=item Description

key value pairs describing metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a reference to a list where each element is a string
name has a value which is a string
library has a value which is a reference to a list where each element is a string
sequence_type has a value which is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a reference to a list where each element is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a reference to a list where each element is a string
name has a value which is a string
library has a value which is a reference to a list where each element is a string
sequence_type has a value which is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a reference to a list where each element is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 LibraryInstance

=over 4



=item Description

a reference to the associated reads object


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a reference to a list where each element is a string
name has a value which is a string
sequence_sets has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
metagenome has a value which is a reference to a list where each element is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a reference to a list where each element is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
reads has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a reference to a list where each element is a string
name has a value which is a string
sequence_sets has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
metagenome has a value which is a reference to a list where each element is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a reference to a list where each element is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
reads has a value which is a reference to a list where each element is a string


=end text

=back



=head2 get_abundanceprofile_instance_rows_object

=over 4



=item Description

unique identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string


=end text

=back



=head2 get_abundanceprofile_instance_columns_object

=over 4



=item Description

unique identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string


=end text

=back



=head2 get_abundanceprofile_instance_params

=over 4



=item Description

This parameter value can be chosen from the following (the first being default):

        organism - return organism data
        function - return functional data
        feature - return feature data


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
verbosity has a value which is a string
source has a value which is a string
id has a value which is a string
type has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
verbosity has a value which is a string
source has a value which is a string
id has a value which is a string
type has a value which is a string


=end text

=back



=head2 AbundanceprofileInstance

=over 4



=item Description

list of the dimension sizes of the return matrix


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a get_abundanceprofile_instance_rows_object
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a get_abundanceprofile_instance_columns_object
id has a value which is a string
type has a value which is a string
shape has a value which is a reference to a list where each element is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a get_abundanceprofile_instance_rows_object
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a get_abundanceprofile_instance_columns_object
id has a value which is a string
type has a value which is a string
shape has a value which is a reference to a list where each element is an int


=end text

=back



=head2 get_library_query_params

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
verbosity has a value which is a string
order has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
verbosity has a value which is a string
order has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 LibraryQuery

=over 4



=item Description

total number of available data items


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a LibraryInstance
offset has a value which is an int
total_count has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a LibraryInstance
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 get_library_instance_params

=over 4



=item Description

unique object identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
verbosity has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
verbosity has a value which is a string
id has a value which is a string


=end text

=back



=head2 get_metagenome_query_params

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
verbosity has a value which is a string
order has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
verbosity has a value which is a string
order has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 MetagenomeQuery

=over 4



=item Description

total number of available data items


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a MetagenomeInstance
offset has a value which is an int
total_count has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a MetagenomeInstance
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 get_metagenome_instance_params

=over 4



=item Description

unique object identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
verbosity has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
verbosity has a value which is a string
id has a value which is a string


=end text

=back



=head2 get_project_query_params

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
verbosity has a value which is a string
order has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
verbosity has a value which is a string
order has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 ProjectQuery

=over 4



=item Description

total number of available data items


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a ProjectInstance
offset has a value which is an int
total_count has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a ProjectInstance
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 get_project_instance_params

=over 4



=item Description

unique object identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
verbosity has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
verbosity has a value which is a string
id has a value which is a string


=end text

=back



=head2 get_sample_query_params

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
order has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
order has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 SampleQuery

=over 4



=item Description

total number of available data items


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a SampleInstance
offset has a value which is an int
total_count has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a SampleInstance
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 get_sample_instance_params

=over 4



=item Description

unique object identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
verbosity has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
verbosity has a value which is a string
id has a value which is a string


=end text

=back



=head2 get_sequences_md5_params

=over 4



=item Description

md5 identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
id has a value which is a string
sequence_type has a value which is a string
md5 has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
id has a value which is a string
sequence_type has a value which is a string
md5 has a value which is a reference to a list where each element is a string


=end text

=back



=head2 SequencesMd5

=over 4



=item Description

unique object identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
id has a value which is a string


=end text

=back



=head2 get_sequences_annotation_params

=over 4



=item Description

organism name


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
data_type has a value which is a string
function has a value which is a reference to a list where each element is a string
id has a value which is a string
sequence_type has a value which is a string
organism has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
data_type has a value which is a string
function has a value which is a reference to a list where each element is a string
id has a value which is a string
sequence_type has a value which is a string
organism has a value which is a string


=end text

=back



=head2 SequencesAnnotation

=over 4



=item Description

unique object identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
id has a value which is a string


=end text

=back



=head2 get_sequenceset_instance_params

=over 4



=item Description

unique sequence set identifier - to get a list of all identifiers for a metagenome, use the list request


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
id has a value which is a string


=end text

=back



=head2 SequencesetInstance

=over 4



=item Description

requested sequence file


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
data has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
data has a value which is a string


=end text

=back



=head2 get_sequenceset_list_params

=over 4



=item Description

unique metagenome identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
id has a value which is a string


=end text

=back



=head2 SequencesetList

=over 4



=item Description

three digit numerical identifier of the stage


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
stage_name has a value which is a string
file_name has a value which is a string
url has a value which is a string
id has a value which is a string
stage_type has a value which is a string
stage_id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
stage_name has a value which is a string
file_name has a value which is a string
url has a value which is a string
id has a value which is a string
stage_type has a value which is a string
stage_id has a value which is a string


=end text

=back



=cut

package CommunitiesAPIClient::RpcClient;
use base 'JSON::RPC::Client';

#
# Override JSON::RPC::Client::call because it doesn't handle error returns properly.
#

sub call {
    my ($self, $uri, $obj) = @_;
    my $result;

    if ($uri =~ /\?/) {
       $result = $self->_get($uri);
    }
    else {
        Carp::croak "not hashref." unless (ref $obj eq 'HASH');
        $result = $self->_post($uri, $obj);
    }

    my $service = $obj->{method} =~ /^system\./ if ( $obj );

    $self->status_line($result->status_line);

    if ($result->is_success) {

        return unless($result->content); # notification?

        if ($service) {
            return JSON::RPC::ServiceObject->new($result, $self->json);
        }

        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    elsif ($result->content_type eq 'application/json')
    {
        return JSON::RPC::ReturnObject->new($result, $self->json);
    }
    else {
        return;
    }
}


sub _post {
    my ($self, $uri, $obj) = @_;
    my $json = $self->json;

    $obj->{version} ||= $self->{version} || '1.1';

    if ($obj->{version} eq '1.0') {
        delete $obj->{version};
        if (exists $obj->{id}) {
            $self->id($obj->{id}) if ($obj->{id}); # if undef, it is notification.
        }
        else {
            $obj->{id} = $self->id || ($self->id('JSON::RPC::Client'));
        }
    }
    else {
        $obj->{id} = $self->id if (defined $self->id);
    }

    my $content = $json->encode($obj);

    $self->ua->post(
        $uri,
        Content_Type   => $self->{content_type},
        Content        => $content,
        Accept         => 'application/json',
	($self->{token} ? (Authorization => $self->{token}) : ()),
    );
}



1;
