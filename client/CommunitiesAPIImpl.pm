package CommunitiesAPIImpl;
use strict;
use Bio::KBase::Exceptions;
# Use Semantic Versioning (2.0.0-rc.1)
# http://semver.org 
our $VERSION = "0.1.0";

=head1 NAME

CommunitiesAPI

=head1 DESCRIPTION



=cut

#BEGIN_HEADER
#END_HEADER

sub new
{
    my($class, @args) = @_;
    my $self = {
    };
    bless $self, $class;
    #BEGIN_CONSTRUCTOR
    #END_CONSTRUCTOR

    if ($self->can('_init_instance'))
    {
	$self->_init_instance();
    }
    return $self;
}

=head1 METHODS



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
	rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	type has a value which is a string
	shape has a value which is a reference to a list where each element is an int

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
	rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	type has a value which is a string
	shape has a value which is a reference to a list where each element is an int


=end text



=item Description



=back

=cut

sub get_abundanceprofile_instance
{
    my $self = shift;
    my($get_abundanceprofile_instance_params) = @_;

    my @_bad_arguments;
    (ref($get_abundanceprofile_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_abundanceprofile_instance_params\" (value was \"$get_abundanceprofile_instance_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_abundanceprofile_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_abundanceprofile_instance');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_abundanceprofile_instance
    #END get_abundanceprofile_instance
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_abundanceprofile_instance:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_abundanceprofile_instance');
    }
    return($return);
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
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	sequencesets has a value which is a reference to a list where each element is a string
	metagenome has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string

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
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	sequencesets has a value which is a reference to a list where each element is a string
	metagenome has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description



=back

=cut

sub get_library_query
{
    my $self = shift;
    my($get_library_query_params) = @_;

    my @_bad_arguments;
    (ref($get_library_query_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_library_query_params\" (value was \"$get_library_query_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_library_query:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_library_query');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_library_query
    #END get_library_query
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_library_query:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_library_query');
    }
    return($return);
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
	project has a value which is a string
	name has a value which is a string
	sequencesets has a value which is a reference to a list where each element is a string
	metagenome has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string

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
	project has a value which is a string
	name has a value which is a string
	sequencesets has a value which is a reference to a list where each element is a string
	metagenome has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description



=back

=cut

sub get_library_instance
{
    my $self = shift;
    my($get_library_instance_params) = @_;

    my @_bad_arguments;
    (ref($get_library_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_library_instance_params\" (value was \"$get_library_instance_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_library_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_library_instance');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_library_instance
    #END get_library_instance
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_library_instance:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_library_instance');
    }
    return($return);
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
	file_size has a value which is an int
	version has a value which is an int
	name has a value which is a string
	library has a value which is a string
	sequence_type has a value which is a string
	created has a value which is a string
	url has a value which is a string
	primary_project has a value which is a string
	id has a value which is a string
	sample has a value which is a string
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
	file_size has a value which is an int
	version has a value which is an int
	name has a value which is a string
	library has a value which is a string
	sequence_type has a value which is a string
	created has a value which is a string
	url has a value which is a string
	primary_project has a value which is a string
	id has a value which is a string
	sample has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description



=back

=cut

sub get_metagenome_query
{
    my $self = shift;
    my($get_metagenome_query_params) = @_;

    my @_bad_arguments;
    (ref($get_metagenome_query_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_metagenome_query_params\" (value was \"$get_metagenome_query_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_metagenome_query:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_metagenome_query');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_metagenome_query
    #END get_metagenome_query
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_metagenome_query:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_metagenome_query');
    }
    return($return);
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
	file_size has a value which is an int
	version has a value which is an int
	name has a value which is a string
	library has a value which is a string
	sequence_type has a value which is a string
	created has a value which is a string
	url has a value which is a string
	primary_project has a value which is a string
	id has a value which is a string
	sample has a value which is a string
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
	file_size has a value which is an int
	version has a value which is an int
	name has a value which is a string
	library has a value which is a string
	sequence_type has a value which is a string
	created has a value which is a string
	url has a value which is a string
	primary_project has a value which is a string
	id has a value which is a string
	sample has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description



=back

=cut

sub get_metagenome_instance
{
    my $self = shift;
    my($get_metagenome_instance_params) = @_;

    my @_bad_arguments;
    (ref($get_metagenome_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_metagenome_instance_params\" (value was \"$get_metagenome_instance_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_metagenome_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_metagenome_instance');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_metagenome_instance
    #END get_metagenome_instance
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_metagenome_instance:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_metagenome_instance');
    }
    return($return);
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
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
ProjectQuery is a reference to a hash where the following keys are defined:
	analyzed has a value which is a reference to a list where each element is a string
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	libraries has a value which is a reference to a list where each element is a string
	created has a value which is a string
	samples has a value which is a reference to a list where each element is a string
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
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
ProjectQuery is a reference to a hash where the following keys are defined:
	analyzed has a value which is a reference to a list where each element is a string
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	libraries has a value which is a reference to a list where each element is a string
	created has a value which is a string
	samples has a value which is a reference to a list where each element is a string
	funding_source has a value which is a string
	url has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	pi has a value which is a string


=end text



=item Description



=back

=cut

sub get_project_query
{
    my $self = shift;
    my($get_project_query_params) = @_;

    my @_bad_arguments;
    (ref($get_project_query_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_project_query_params\" (value was \"$get_project_query_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_project_query:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_project_query');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_project_query
    #END get_project_query
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_project_query:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_project_query');
    }
    return($return);
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
	analyzed has a value which is a reference to a list where each element is a string
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	libraries has a value which is a reference to a list where each element is a string
	created has a value which is a string
	samples has a value which is a reference to a list where each element is a string
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
	analyzed has a value which is a reference to a list where each element is a string
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	libraries has a value which is a reference to a list where each element is a string
	created has a value which is a string
	samples has a value which is a reference to a list where each element is a string
	funding_source has a value which is a string
	url has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	pi has a value which is a string


=end text



=item Description



=back

=cut

sub get_project_instance
{
    my $self = shift;
    my($get_project_instance_params) = @_;

    my @_bad_arguments;
    (ref($get_project_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_project_instance_params\" (value was \"$get_project_instance_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_project_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_project_instance');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_project_instance
    #END get_project_instance
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_project_instance:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_project_instance');
    }
    return($return);
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
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	metagenomes has a value which is a reference to a list where each element is a string
	libraries has a value which is a reference to a list where each element is a string
	created has a value which is a string
	env_package has a value which is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	id has a value which is a string
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
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	metagenomes has a value which is a reference to a list where each element is a string
	libraries has a value which is a reference to a list where each element is a string
	created has a value which is a string
	env_package has a value which is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	id has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description



=back

=cut

sub get_sample_query
{
    my $self = shift;
    my($get_sample_query_params) = @_;

    my @_bad_arguments;
    (ref($get_sample_query_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_sample_query_params\" (value was \"$get_sample_query_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_sample_query:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sample_query');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_sample_query
    #END get_sample_query
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_sample_query:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sample_query');
    }
    return($return);
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
	project has a value which is a string
	name has a value which is a string
	metagenomes has a value which is a reference to a list where each element is a string
	libraries has a value which is a reference to a list where each element is a string
	created has a value which is a string
	env_package has a value which is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	id has a value which is a string
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
	project has a value which is a string
	name has a value which is a string
	metagenomes has a value which is a reference to a list where each element is a string
	libraries has a value which is a reference to a list where each element is a string
	created has a value which is a string
	env_package has a value which is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	id has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description



=back

=cut

sub get_sample_instance
{
    my $self = shift;
    my($get_sample_instance_params) = @_;

    my @_bad_arguments;
    (ref($get_sample_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_sample_instance_params\" (value was \"$get_sample_instance_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_sample_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sample_instance');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_sample_instance
    #END get_sample_instance
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_sample_instance:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sample_instance');
    }
    return($return);
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
SequencesMd5 is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	id has a value which is a string

</pre>

=end html

=begin text

$get_sequences_md5_params is a get_sequences_md5_params
$return is a SequencesMd5
get_sequences_md5_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
	sequence_type has a value which is a string
SequencesMd5 is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	id has a value which is a string


=end text



=item Description



=back

=cut

sub get_sequences_md5
{
    my $self = shift;
    my($get_sequences_md5_params) = @_;

    my @_bad_arguments;
    (ref($get_sequences_md5_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_sequences_md5_params\" (value was \"$get_sequences_md5_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_sequences_md5:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sequences_md5');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_sequences_md5
    #END get_sequences_md5
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_sequences_md5:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sequences_md5');
    }
    return($return);
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
	id has a value which is a string
	sequence_type has a value which is a string
	organism has a value which is a string
SequencesAnnotation is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	id has a value which is a string

</pre>

=end html

=begin text

$get_sequences_annotation_params is a get_sequences_annotation_params
$return is a SequencesAnnotation
get_sequences_annotation_params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	data_type has a value which is a string
	id has a value which is a string
	sequence_type has a value which is a string
	organism has a value which is a string
SequencesAnnotation is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	id has a value which is a string


=end text



=item Description



=back

=cut

sub get_sequences_annotation
{
    my $self = shift;
    my($get_sequences_annotation_params) = @_;

    my @_bad_arguments;
    (ref($get_sequences_annotation_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_sequences_annotation_params\" (value was \"$get_sequences_annotation_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_sequences_annotation:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sequences_annotation');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_sequences_annotation
    #END get_sequences_annotation
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_sequences_annotation:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sequences_annotation');
    }
    return($return);
}




=head2 version 

  $return = $obj->version()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a string
</pre>

=end html

=begin text

$return is a string

=end text

=item Description

Return the module version. This is a Semantic Versioning number.

=back

=cut

sub version {
    return $VERSION;
}

=head1 TYPES



=head2 get_abundanceprofile_instance_params

=over 4



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



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
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
rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
type has a value which is a string
shape has a value which is a reference to a list where each element is an int


=end text

=back



=head2 get_library_query_params

=over 4



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



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
sequencesets has a value which is a reference to a list where each element is a string
metagenome has a value which is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
sequencesets has a value which is a reference to a list where each element is a string
metagenome has a value which is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_library_instance_params

=over 4



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



=head2 LibraryInstance

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
sequencesets has a value which is a reference to a list where each element is a string
metagenome has a value which is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
sequencesets has a value which is a reference to a list where each element is a string
metagenome has a value which is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_metagenome_query_params

=over 4



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



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
file_size has a value which is an int
version has a value which is an int
name has a value which is a string
library has a value which is a string
sequence_type has a value which is a string
created has a value which is a string
url has a value which is a string
primary_project has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
file_size has a value which is an int
version has a value which is an int
name has a value which is a string
library has a value which is a string
sequence_type has a value which is a string
created has a value which is a string
url has a value which is a string
primary_project has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_metagenome_instance_params

=over 4



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



=head2 MetagenomeInstance

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
file_size has a value which is an int
version has a value which is an int
name has a value which is a string
library has a value which is a string
sequence_type has a value which is a string
created has a value which is a string
url has a value which is a string
primary_project has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
file_size has a value which is an int
version has a value which is an int
name has a value which is a string
library has a value which is a string
sequence_type has a value which is a string
created has a value which is a string
url has a value which is a string
primary_project has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_project_query_params

=over 4



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



=head2 ProjectQuery

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
analyzed has a value which is a reference to a list where each element is a string
version has a value which is an int
name has a value which is a string
description has a value which is a string
libraries has a value which is a reference to a list where each element is a string
created has a value which is a string
samples has a value which is a reference to a list where each element is a string
funding_source has a value which is a string
url has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
pi has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
analyzed has a value which is a reference to a list where each element is a string
version has a value which is an int
name has a value which is a string
description has a value which is a string
libraries has a value which is a reference to a list where each element is a string
created has a value which is a string
samples has a value which is a reference to a list where each element is a string
funding_source has a value which is a string
url has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
pi has a value which is a string


=end text

=back



=head2 get_project_instance_params

=over 4



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



=head2 ProjectInstance

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
analyzed has a value which is a reference to a list where each element is a string
version has a value which is an int
name has a value which is a string
description has a value which is a string
libraries has a value which is a reference to a list where each element is a string
created has a value which is a string
samples has a value which is a reference to a list where each element is a string
funding_source has a value which is a string
url has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
pi has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
analyzed has a value which is a reference to a list where each element is a string
version has a value which is an int
name has a value which is a string
description has a value which is a string
libraries has a value which is a reference to a list where each element is a string
created has a value which is a string
samples has a value which is a reference to a list where each element is a string
funding_source has a value which is a string
url has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
pi has a value which is a string


=end text

=back



=head2 get_sample_query_params

=over 4



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



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
metagenomes has a value which is a reference to a list where each element is a string
libraries has a value which is a reference to a list where each element is a string
created has a value which is a string
env_package has a value which is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
id has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
metagenomes has a value which is a reference to a list where each element is a string
libraries has a value which is a reference to a list where each element is a string
created has a value which is a string
env_package has a value which is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
id has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_sample_instance_params

=over 4



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



=head2 SampleInstance

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
metagenomes has a value which is a reference to a list where each element is a string
libraries has a value which is a reference to a list where each element is a string
created has a value which is a string
env_package has a value which is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
id has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
metagenomes has a value which is a reference to a list where each element is a string
libraries has a value which is a reference to a list where each element is a string
created has a value which is a string
env_package has a value which is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
id has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_sequences_md5_params

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
id has a value which is a string
sequence_type has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
id has a value which is a string
sequence_type has a value which is a string


=end text

=back



=head2 SequencesMd5

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
id has a value which is a string


=end text

=back



=head2 get_sequences_annotation_params

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
data_type has a value which is a string
id has a value which is a string
sequence_type has a value which is a string
organism has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
data_type has a value which is a string
id has a value which is a string
sequence_type has a value which is a string
organism has a value which is a string


=end text

=back



=head2 SequencesAnnotation

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
id has a value which is a string


=end text

=back



=cut

1;
