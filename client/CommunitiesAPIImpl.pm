package CommunitiesAPIImpl;
use strict;
use Bio::KBase::Exceptions;
# Use Semantic Versioning (2.0.0-rc.1)
# http://semver.org 
our $VERSION = "0.1.0";

=head1 NAME

CommunitiesAPI

=head1 DESCRIPTION

Communities object and resource API

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




=head2 get_analysisset_instance

  $return = $obj->get_analysisset_instance($get_analysisset_instance_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_analysisset_instance_params is a get_analysisset_instance_params
$return is an AnalysissetInstance
get_analysisset_instance_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
AnalysissetInstance is a reference to a hash where the following keys are defined:
	data has a value which is a string

</pre>

=end html

=begin text

$get_analysisset_instance_params is a get_analysisset_instance_params
$return is an AnalysissetInstance
get_analysisset_instance_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
AnalysissetInstance is a reference to a hash where the following keys are defined:
	data has a value which is a string


=end text



=item Description

An analysis file from the processing of a metagenome from a specific stage in its analysis
Returns a single sequence file.

=back

=cut

sub get_analysisset_instance
{
    my $self = shift;
    my($get_analysisset_instance_params) = @_;

    my @_bad_arguments;
    (ref($get_analysisset_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_analysisset_instance_params\" (value was \"$get_analysisset_instance_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_analysisset_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_analysisset_instance');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_analysisset_instance
    #END get_analysisset_instance
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_analysisset_instance:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_analysisset_instance');
    }
    return($return);
}




=head2 get_analysisset_setlist

  $return = $obj->get_analysisset_setlist($get_analysisset_setlist_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_analysisset_setlist_params is a get_analysisset_setlist_params
$return is an AnalysissetSetlist
get_analysisset_setlist_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
AnalysissetSetlist is a reference to a hash where the following keys are defined:
	stage_name has a value which is a string
	file_name has a value which is a string
	url has a value which is a string
	id has a value which is a string
	stage_type has a value which is a string
	stage_id has a value which is a string

</pre>

=end html

=begin text

$get_analysisset_setlist_params is a get_analysisset_setlist_params
$return is an AnalysissetSetlist
get_analysisset_setlist_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
AnalysissetSetlist is a reference to a hash where the following keys are defined:
	stage_name has a value which is a string
	file_name has a value which is a string
	url has a value which is a string
	id has a value which is a string
	stage_type has a value which is a string
	stage_id has a value which is a string


=end text



=item Description

An analysis file from the processing of a metagenome from a specific stage in its analysis
Returns a list of sets of sequence files for the given id.

=back

=cut

sub get_analysisset_setlist
{
    my $self = shift;
    my($get_analysisset_setlist_params) = @_;

    my @_bad_arguments;
    (ref($get_analysisset_setlist_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_analysisset_setlist_params\" (value was \"$get_analysisset_setlist_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_analysisset_setlist:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_analysisset_setlist');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_analysisset_setlist
    #END get_analysisset_setlist
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_analysisset_setlist:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_analysisset_setlist');
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
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a get_library_query_data_object
	offset has a value which is an int
	total_count has a value which is an int
get_library_query_data_object is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
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
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a get_library_query_data_object
	offset has a value which is an int
	total_count has a value which is an int
get_library_query_data_object is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	metagenome has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description

A library of metagenomic samples from some environment
Returns a set of data matching the query criteria.

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

A library of metagenomic samples from some environment
Returns a single data object.

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




=head2 get_matrix_organism

  $return = $obj->get_matrix_organism($get_matrix_organism_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_matrix_organism_params is a get_matrix_organism_params
$return is a MatrixOrganism
get_matrix_organism_params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	result_type has a value which is a string
	id has a value which is a string
	group_level has a value which is a string
MatrixOrganism is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a get_matrix_organism_rows_object
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a get_matrix_organism_columns_object
	id has a value which is a string
	type has a value which is a string
	shape has a value which is a reference to a list where each element is an int
get_matrix_organism_rows_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
get_matrix_organism_columns_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string

</pre>

=end html

=begin text

$get_matrix_organism_params is a get_matrix_organism_params
$return is a MatrixOrganism
get_matrix_organism_params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	result_type has a value which is a string
	id has a value which is a string
	group_level has a value which is a string
MatrixOrganism is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a get_matrix_organism_rows_object
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a get_matrix_organism_columns_object
	id has a value which is a string
	type has a value which is a string
	shape has a value which is a reference to a list where each element is an int
get_matrix_organism_rows_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
get_matrix_organism_columns_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string


=end text



=item Description

A profile in biom format that contains abundance counts
Returns a single data object.

=back

=cut

sub get_matrix_organism
{
    my $self = shift;
    my($get_matrix_organism_params) = @_;

    my @_bad_arguments;
    (ref($get_matrix_organism_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_matrix_organism_params\" (value was \"$get_matrix_organism_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_matrix_organism:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_matrix_organism');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_matrix_organism
    #END get_matrix_organism
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_matrix_organism:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_matrix_organism');
    }
    return($return);
}




=head2 get_matrix_function

  $return = $obj->get_matrix_function($get_matrix_function_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_matrix_function_params is a get_matrix_function_params
$return is a MatrixFunction
get_matrix_function_params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	result_type has a value which is a string
	id has a value which is a string
	group_level has a value which is a string
MatrixFunction is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a get_matrix_function_rows_object
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a get_matrix_function_columns_object
	id has a value which is a string
	type has a value which is a string
	shape has a value which is a reference to a list where each element is an int
get_matrix_function_rows_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
get_matrix_function_columns_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string

</pre>

=end html

=begin text

$get_matrix_function_params is a get_matrix_function_params
$return is a MatrixFunction
get_matrix_function_params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	result_type has a value which is a string
	id has a value which is a string
	group_level has a value which is a string
MatrixFunction is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a get_matrix_function_rows_object
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a get_matrix_function_columns_object
	id has a value which is a string
	type has a value which is a string
	shape has a value which is a reference to a list where each element is an int
get_matrix_function_rows_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
get_matrix_function_columns_object is a reference to a hash where the following keys are defined:
	metadata has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string


=end text



=item Description

A profile in biom format that contains abundance counts
Returns a single data object.

=back

=cut

sub get_matrix_function
{
    my $self = shift;
    my($get_matrix_function_params) = @_;

    my @_bad_arguments;
    (ref($get_matrix_function_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_matrix_function_params\" (value was \"$get_matrix_function_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_matrix_function:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_matrix_function');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_matrix_function
    #END get_matrix_function
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_matrix_function:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_matrix_function');
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
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a get_metagenome_query_data_object
	total_count has a value which is an int
	offset has a value which is an int
get_metagenome_query_data_object is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	sequence_type has a value which is a string
	library has a value which is a string
	created has a value which is a string
	url has a value which is a string
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
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a get_metagenome_query_data_object
	total_count has a value which is an int
	offset has a value which is an int
get_metagenome_query_data_object is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	sequence_type has a value which is a string
	library has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description

A metagenome is an analyzed set sequences from a sample of some environment
Returns a set of data matching the query criteria.

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
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	sequence_type has a value which is a string
	library has a value which is a string
	created has a value which is a string
	url has a value which is a string
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
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	sequence_type has a value which is a string
	library has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	sample has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description

A metagenome is an analyzed set sequences from a sample of some environment
Returns a single data object.

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




=head2 get_metagenome_statistics_instance

  $return = $obj->get_metagenome_statistics_instance($get_metagenome_statistics_instance_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_metagenome_statistics_instance_params is a get_metagenome_statistics_instance_params
$return is a Metagenome_statisticsInstance
get_metagenome_statistics_instance_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
Metagenome_statisticsInstance is a reference to a hash where the following keys are defined:
	basic has a value which is a reference to a hash where the key is a string and the value is a string
	drisee_stats has a value which is a reference to a hash where the key is a string and the value is a string
	dereplication_passed has a value which is a reference to a hash where the key is a string and the value is a string
	NOG has a value which is a reference to a hash where the key is a string and the value is a string
	domain has a value which is a reference to a hash where the key is a string and the value is a string
	COG has a value which is a reference to a hash where the key is a string and the value is a string
	sims has a value which is a reference to a hash where the key is a string and the value is a string
	order has a value which is a reference to a hash where the key is a string and the value is a string
	Subsystem has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	kmer_15 has a value which is a reference to a hash where the key is a string and the value is a string
	drisee_info has a value which is a reference to a hash where the key is a string and the value is a string
	kmer_6 has a value which is a reference to a hash where the key is a string and the value is a string
	KO has a value which is a reference to a hash where the key is a string and the value is a string
	genus has a value which is a reference to a hash where the key is a string and the value is a string
	species has a value which is a reference to a hash where the key is a string and the value is a string
	consensus has a value which is a reference to a hash where the key is a string and the value is a string
	preprocess_removed has a value which is a reference to a hash where the key is a string and the value is a string
	rarefaction has a value which is a reference to a hash where the key is a string and the value is a string
	phylum has a value which is a reference to a hash where the key is a string and the value is a string
	class has a value which is a reference to a hash where the key is a string and the value is a string
	preprocess_passed has a value which is a reference to a hash where the key is a string and the value is a string
	dereplication_removed has a value which is a reference to a hash where the key is a string and the value is a string
	family has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$get_metagenome_statistics_instance_params is a get_metagenome_statistics_instance_params
$return is a Metagenome_statisticsInstance
get_metagenome_statistics_instance_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
Metagenome_statisticsInstance is a reference to a hash where the following keys are defined:
	basic has a value which is a reference to a hash where the key is a string and the value is a string
	drisee_stats has a value which is a reference to a hash where the key is a string and the value is a string
	dereplication_passed has a value which is a reference to a hash where the key is a string and the value is a string
	NOG has a value which is a reference to a hash where the key is a string and the value is a string
	domain has a value which is a reference to a hash where the key is a string and the value is a string
	COG has a value which is a reference to a hash where the key is a string and the value is a string
	sims has a value which is a reference to a hash where the key is a string and the value is a string
	order has a value which is a reference to a hash where the key is a string and the value is a string
	Subsystem has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string
	kmer_15 has a value which is a reference to a hash where the key is a string and the value is a string
	drisee_info has a value which is a reference to a hash where the key is a string and the value is a string
	kmer_6 has a value which is a reference to a hash where the key is a string and the value is a string
	KO has a value which is a reference to a hash where the key is a string and the value is a string
	genus has a value which is a reference to a hash where the key is a string and the value is a string
	species has a value which is a reference to a hash where the key is a string and the value is a string
	consensus has a value which is a reference to a hash where the key is a string and the value is a string
	preprocess_removed has a value which is a reference to a hash where the key is a string and the value is a string
	rarefaction has a value which is a reference to a hash where the key is a string and the value is a string
	phylum has a value which is a reference to a hash where the key is a string and the value is a string
	class has a value which is a reference to a hash where the key is a string and the value is a string
	preprocess_passed has a value which is a reference to a hash where the key is a string and the value is a string
	dereplication_removed has a value which is a reference to a hash where the key is a string and the value is a string
	family has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description

An set of statistical information obtained during the analysis of a metagenomic sequence
Returns a JSON structure of statistical information.

=back

=cut

sub get_metagenome_statistics_instance
{
    my $self = shift;
    my($get_metagenome_statistics_instance_params) = @_;

    my @_bad_arguments;
    (ref($get_metagenome_statistics_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_metagenome_statistics_instance_params\" (value was \"$get_metagenome_statistics_instance_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_metagenome_statistics_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_metagenome_statistics_instance');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_metagenome_statistics_instance
    #END get_metagenome_statistics_instance
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_metagenome_statistics_instance:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_metagenome_statistics_instance');
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
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
ProjectQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a get_project_query_data_object
	offset has a value which is an int
	total_count has a value which is an int
get_project_query_data_object is a reference to a hash where the following keys are defined:
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	created has a value which is a string
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
	data has a value which is a reference to a list where each element is a get_project_query_data_object
	offset has a value which is an int
	total_count has a value which is an int
get_project_query_data_object is a reference to a hash where the following keys are defined:
	version has a value which is an int
	name has a value which is a string
	description has a value which is a string
	created has a value which is a string
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

A project is a composition of samples, libraries and metagenomes being analyzed in a global context.
Returns a single data object.

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
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a get_sample_query_data_object
	offset has a value which is an int
	total_count has a value which is an int
get_sample_query_data_object is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	created has a value which is a string
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
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a get_sample_query_data_object
	offset has a value which is an int
	total_count has a value which is an int
get_sample_query_data_object is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	created has a value which is a string
	url has a value which is a string
	id has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text



=item Description

A metagenomic sample from some environment.
Returns a set of data matching the query criteria.

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
	project has a value which is a string
	name has a value which is a string
	metagenomes has a value which is a reference to a list where each element is a string
	libraries has a value which is a reference to a list where each element is a string
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

A set of genomic sequences of a metagenome annotated by a specified source
Returns a single data object.

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
	ontology has a value which is a reference to a list where each element is a string
	source has a value which is a string
	data_type has a value which is a string
	function has a value which is a reference to a list where each element is a string
	id has a value which is a string
	sequence_type has a value which is a string
	organism has a value which is a reference to a list where each element is a string
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
	ontology has a value which is a reference to a list where each element is a string
	source has a value which is a string
	data_type has a value which is a string
	function has a value which is a reference to a list where each element is a string
	id has a value which is a string
	sequence_type has a value which is a string
	organism has a value which is a reference to a list where each element is a string
SequencesAnnotation is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string


=end text



=item Description

A set of genomic sequences of a metagenome annotated by a specified source
Returns a single data object.

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
    my $self = shift;
    my($get_sequenceset_instance_params) = @_;

    my @_bad_arguments;
    (ref($get_sequenceset_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_sequenceset_instance_params\" (value was \"$get_sequenceset_instance_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_sequenceset_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sequenceset_instance');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_sequenceset_instance
    #END get_sequenceset_instance
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_sequenceset_instance:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sequenceset_instance');
    }
    return($return);
}




=head2 get_sequenceset_setlist

  $return = $obj->get_sequenceset_setlist($get_sequenceset_setlist_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$get_sequenceset_setlist_params is a get_sequenceset_setlist_params
$return is a SequencesetSetlist
get_sequenceset_setlist_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
SequencesetSetlist is a reference to a hash where the following keys are defined:
	stage_name has a value which is a string
	file_name has a value which is a string
	url has a value which is a string
	id has a value which is a string
	stage_type has a value which is a string
	stage_id has a value which is a string

</pre>

=end html

=begin text

$get_sequenceset_setlist_params is a get_sequenceset_setlist_params
$return is a SequencesetSetlist
get_sequenceset_setlist_params is a reference to a hash where the following keys are defined:
	id has a value which is a string
SequencesetSetlist is a reference to a hash where the following keys are defined:
	stage_name has a value which is a string
	file_name has a value which is a string
	url has a value which is a string
	id has a value which is a string
	stage_type has a value which is a string
	stage_id has a value which is a string


=end text



=item Description

A set / subset of genomic sequences of a metagenome from a specific stage in its analysis
Returns a list of sets of sequence files for the given id.

=back

=cut

sub get_sequenceset_setlist
{
    my $self = shift;
    my($get_sequenceset_setlist_params) = @_;

    my @_bad_arguments;
    (ref($get_sequenceset_setlist_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"get_sequenceset_setlist_params\" (value was \"$get_sequenceset_setlist_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to get_sequenceset_setlist:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sequenceset_setlist');
    }

    my $ctx = $CommunitiesAPIServer::CallContext;
    my($return);
    #BEGIN get_sequenceset_setlist
    #END get_sequenceset_setlist
    my @_bad_returns;
    (ref($return) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to get_sequenceset_setlist:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'get_sequenceset_setlist');
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



=head2 get_abundanceprofile_instance_rows_object

=over 4



=item Description

rows object

mapping<string, string> metadata: key value pairs describing metadata
string id: unique identifier


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

columns object

mapping<string, string> metadata: list of metadata, contains the metagenome
string id: unique identifier


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

string source: This parameter value can be chosen from the following (the first being default):

M5NR - comprehensive protein database, type organism only
SwissProt - protein database, type organism and feature only
GenBank - protein database, type organism and feature only
IMG - protein database, type organism and feature only
SEED - protein database, type organism and feature only
TrEMBL - protein database, type organism and feature only
RefSeq - protein database, type organism and feature only
PATRIC - protein database, type organism and feature only
KEGG - protein database, type organism and feature only
M5RNA - comprehensive RNA database, type organism only
RDP - RNA database, type organism and feature only
Greengenes - RNA database, type organism and feature only
LSU - RNA database, type organism and feature only
SSU - RNA database, type organism and feature only
Subsystems - ontology database, type function only
NOG - ontology database, type function only
COG - ontology database, type function only
KO - ontology database, type function only

string id: unique object identifier

string type: This parameter value can be chosen from the following (the first being default):

organism - return organism data
function - return functional data
feature - return feature data


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
id has a value which is a string
type has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
id has a value which is a string
type has a value which is a string


=end text

=back



=head2 AbundanceprofileInstance

=over 4



=item Description

string generated_by: identifier of the data generator

string matrix_type: type of the data encoding matrix (dense or sparse)

string date: time the output data was generated

list<list<float> data: the matrix values

list<get_abundanceprofile_instance_rows_object> rows: rows object

string matrix_element_type: data type of the elements in the return matrix

string format_url: url to the format specification

string format: format specification name

list<get_abundanceprofile_instance_columns_object> columns: columns object

string id: unique object identifier

string type: type of the data in the return table (taxon, function or gene)

list<int> shape: list of the dimension sizes of the return matrix


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



=head2 get_analysisset_instance_params

=over 4



=item Description

string id: unique analysis set identifier - to get a list of all identifiers for a metagenome, use the setlist request


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



=head2 AnalysissetInstance

=over 4



=item Description

string data: requested analysis file


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



=head2 get_analysisset_setlist_params

=over 4



=item Description

string id: unique metagenome identifier


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



=head2 AnalysissetSetlist

=over 4



=item Description

string stage_name: name of the stage in processing of this file

string file_name: name of the analysis file

string url: url for retrieving this analysis file

string id: unique identifier of the analysis file

string stage_type: type of the analysis file within a stage, i.e. passed or removed for quality control steps

string stage_id: three digit numerical identifier of the stage


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



=head2 get_library_query_data_object

=over 4



=item Description

list of the library objects

int version: version of the object
string project: reference to the project object
string name: human readable identifier
string metagenome: reference to the related metagenome object
string created: time the object was first created
string url: resource location of this object instance
string id: unique object identifier
string sample: reference to the related sample object
mapping<string, string> metadata: key value pairs describing metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
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
metagenome has a value which is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_library_query_params

=over 4



=item Description

string verbosity: This parameter value can be chosen from the following (the first being default):

minimal - returns only minimal information

string order: This parameter value can be chosen from the following (the first being default):

id - return data objects ordered by id
name - return data objects ordered by name

int limit: maximum number of items requested

int offset: zero based index of the first data object to be returned


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

string next: link to the previous set or null if this is the first set

string prev: link to the next set or null if this is the last set

string order: name of the attribute the returned data is ordered by

int limit: maximum number of data items returned, default is 10

list<get_library_query_data_object> data: list of the library objects

int offset: zero based index of the first returned data item

int total_count: total number of available data items


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a get_library_query_data_object
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
data has a value which is a reference to a list where each element is a get_library_query_data_object
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 get_library_instance_params

=over 4



=item Description

string verbosity: This parameter value can be chosen from the following (the first being default):

minimal - returns only minimal information
verbose - returns a standard subselection of metadata
full - returns all connected metadata

string id: unique object identifier


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



=item Description

int version: version of the object

string project: reference to the project object

string name: human readable identifier

list<string> sequencesets: a list of references to the related sequence sets

string metagenome: reference to the related metagenome object

string created: time the object was first created

string url: resource location of this object instance

string id: unique object identifier

string sample: reference to the related sample object

mapping<string, string> metadata: key value pairs describing metadata


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



=head2 get_matrix_organism_columns_object

=over 4



=item Description

columns object

mapping<string, string> metadata: key value pairs describing metadata
string id: unique metagenome identifier


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



=head2 get_matrix_organism_rows_object

=over 4



=item Description

rows object

mapping<string, string> metadata: key value pairs describing metadata
string id: unique annotation text


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



=head2 get_matrix_organism_params

=over 4



=item Description

string source: This parameter value can be chosen from the following (the first being default):

M5NR - comprehensive protein database
RefSeq - protein database
SwissProt - protein database
GenBank - protein database
IMG - protein database
SEED - protein database
TrEMBL - protein database
PATRIC - protein database
KEGG - protein database
M5RNA - comprehensive RNA database
RDP - RNA database
Greengenes - RNA database
LSU - RNA database
SSU - RNA database

string result_type: This parameter value can be chosen from the following (the first being default):

abundance - number of reads with hits in annotation
evalue - average e-value exponent of hits in annotation
identity - average percent identity of hits in annotation
length - average alignment length of hits in annotation

string id: one or more metagenome or project unique identifier

string group_level: This parameter value can be chosen from the following (the first being default):

strain - bottom organism taxanomic level
species - organism type level
genus - organism taxanomic level
family - organism taxanomic level
order - organism taxanomic level
class - organism taxanomic level
phylum - organism taxanomic level
domain - top organism taxanomic level


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
result_type has a value which is a string
id has a value which is a string
group_level has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
result_type has a value which is a string
id has a value which is a string
group_level has a value which is a string


=end text

=back



=head2 MatrixOrganism

=over 4



=item Description

string generated_by: identifier of the data generator

string matrix_type: type of the data encoding matrix (dense or sparse)

string date: time the output data was generated

list<list<float> data: the matrix values

list<get_matrix_organism_rows_object> rows: rows object

string matrix_element_value: result_type of the elements in the return matrix

string matrix_element_type: data type of the elements in the return matrix

string format_url: url to the format specification

string format: format specification name

list<get_matrix_organism_columns_object> columns: columns object

string id: unique object identifier

string type: type of the data in the return table (taxon, function or gene)

list<int> shape: list of the dimension sizes of the return matrix


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a get_matrix_organism_rows_object
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a get_matrix_organism_columns_object
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
rows has a value which is a reference to a list where each element is a get_matrix_organism_rows_object
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a get_matrix_organism_columns_object
id has a value which is a string
type has a value which is a string
shape has a value which is a reference to a list where each element is an int


=end text

=back



=head2 get_matrix_function_rows_object

=over 4



=item Description

rows object

mapping<string, string> metadata: key value pairs describing metadata
string id: unique annotation text


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



=head2 get_matrix_function_columns_object

=over 4



=item Description

columns object

mapping<string, string> metadata: key value pairs describing metadata
string id: unique metagenome identifier


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



=head2 get_matrix_function_params

=over 4



=item Description

string source: This parameter value can be chosen from the following (the first being default):

Subsystems - ontology database, type function only
NOG - ontology database, type function only
COG - ontology database, type function only
KO - ontology database, type function only

string result_type: This parameter value can be chosen from the following (the first being default):

abundance - number of reads with hits in annotation
evalue - average e-value exponent of hits in annotation
identity - average percent identity of hits in annotation
length - average alignment length of hits in annotation

string id: one or more metagenome or project unique identifier

string group_level: This parameter value can be chosen from the following (the first being default):

function - bottom ontology level (function:default)
level3 - function type level (function)
level2 - function type level (function)
level1 - top function type level (function)


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
result_type has a value which is a string
id has a value which is a string
group_level has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
result_type has a value which is a string
id has a value which is a string
group_level has a value which is a string


=end text

=back



=head2 MatrixFunction

=over 4



=item Description

string generated_by: identifier of the data generator

string matrix_type: type of the data encoding matrix (dense or sparse)

string date: time the output data was generated

list<list<float> data: the matrix values

list<get_matrix_function_rows_object> rows: rows object

string matrix_element_value: result_type of the elements in the return matrix

string matrix_element_type: data type of the elements in the return matrix

string format_url: url to the format specification

string format: format specification name

list<get_matrix_function_columns_object> columns: columns object

string id: unique object identifier

string type: type of the data in the return table (taxon, function or gene)

list<int> shape: list of the dimension sizes of the return matrix


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a get_matrix_function_rows_object
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a get_matrix_function_columns_object
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
rows has a value which is a reference to a list where each element is a get_matrix_function_rows_object
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a get_matrix_function_columns_object
id has a value which is a string
type has a value which is a string
shape has a value which is a reference to a list where each element is an int


=end text

=back



=head2 get_matrix_feature_rows_object

=over 4



=item Description

rows object

mapping<string, string> metadata: key value pairs describing metadata
string id: unique annotation text


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



=head2 get_matrix_feature_columns_object

=over 4



=item Description

columns object

mapping<string, string> metadata: key value pairs describing metadata
string id: unique metagenome identifier


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



=head2 get_matrix_feature_params

=over 4



=item Description

string source: This parameter value can be chosen from the following (the first being default):

RefSeq - protein database
SwissProt - protein database
GenBank - protein database
IMG - protein database
SEED - protein database
TrEMBL - protein database
PATRIC - protein database
KEGG - protein database
RDP - RNA database
Greengenes - RNA database
LSU - RNA database
SSU - RNA database

string result_type: This parameter value can be chosen from the following (the first being default):

abundance - number of reads with hits in annotation
evalue - average e-value exponent of hits in annotation
identity - average percent identity of hits in annotation
length - average alignment length of hits in annotation

string id: one or more metagenome or project unique identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
result_type has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
result_type has a value which is a string
id has a value which is a string


=end text

=back



=head2 get_metagenome_query_data_object

=over 4



=item Description

list of the metagenome objects

int version: version of the object
string project: reference to the project object
string name: human readable identifier
string sequence_type: sequencing type
string library: reference to the related library object
string created: time the object was first created
string url: resource location of this object instance
string id: unique object identifier
string sample: reference to the related sample object
mapping<string, string> metadata: key value pairs describing metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
sequence_type has a value which is a string
library has a value which is a string
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
sequence_type has a value which is a string
library has a value which is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_metagenome_query_params

=over 4



=item Description

string verbosity: This parameter value can be chosen from the following (the first being default):

minimal - returns only minimal information
verbose - returns a standard subselection of metadata
full - returns all connected metadata

string order: This parameter value can be chosen from the following (the first being default):

id - return data objects ordered by id
name - return data objects ordered by name

int limit: maximum number of items requested

int offset: zero based index of the first data object to be returned


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

string next: link to the previous set or null if this is the first set

string prev: link to the next set or null if this is the last set

string order: name of the attribute the returned data is ordered by

int limit: maximum number of data items returned, default is 10

list<get_metagenome_query_data_object> data: list of the metagenome objects

int total_count: total number of available data items

int offset: zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a get_metagenome_query_data_object
total_count has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a get_metagenome_query_data_object
total_count has a value which is an int
offset has a value which is an int


=end text

=back



=head2 get_metagenome_instance_params

=over 4



=item Description

string verbosity: This parameter value can be chosen from the following (the first being default):

minimal - returns only minimal information
verbose - returns a standard subselection of metadata
full - returns all connected metadata

string id: unique object identifier


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



=item Description

int version: version of the object

string project: reference to the project object

string name: human readable identifier

string sequence_type: sequencing type

string library: reference to the related library object

string created: time the object was first created

string url: resource location of this object instance

string id: unique object identifier

string sample: reference to the related sample object

mapping<string, string> metadata: key value pairs describing metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
sequence_type has a value which is a string
library has a value which is a string
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
sequence_type has a value which is a string
library has a value which is a string
created has a value which is a string
url has a value which is a string
id has a value which is a string
sample has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_metagenome_statistics_instance_params

=over 4



=item Description

string id: metagenome id


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



=head2 Metagenome_statisticsInstance

=over 4



=item Description

mapping<string, string> basic: basic sequence information about the uploaded data

mapping<string, string> drisee_stats: drisee statistics

mapping<string, string> dereplication_passed: basic sequence information about the data that passed dereplication

mapping<string, string> NOG: NOG counts

mapping<string, string> domain: domain counts

mapping<string, string> COG: COG counts

mapping<string, string> sims: sims counts

mapping<string, string> order: order counts

mapping<string, string> Subsystem: Subsystem counts

string id: unique metagenome id

mapping<string, string> kmer_15: kmer 15 counts

mapping<string, string> drisee_info: basic drisee information

mapping<string, string> kmer_6: kmer 6 counts

mapping<string, string> KO: KO counts

mapping<string, string> genus: genus counts

mapping<string, string> species: species counts

mapping<string, string> consensus: consensus information

mapping<string, string> preprocess_removed: basic sequence information about the data that was removed during preprocessing

mapping<string, string> rarefaction: rarefaction data

mapping<string, string> phylum: phylum counts

mapping<string, string> class: class counts

mapping<string, string> preprocess_passed: basic sequence information about the data that passed preprocessing

mapping<string, string> dereplication_removed: basic sequence information about the data that was removed during preprocessing

mapping<string, string> family: family counts


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
basic has a value which is a reference to a hash where the key is a string and the value is a string
drisee_stats has a value which is a reference to a hash where the key is a string and the value is a string
dereplication_passed has a value which is a reference to a hash where the key is a string and the value is a string
NOG has a value which is a reference to a hash where the key is a string and the value is a string
domain has a value which is a reference to a hash where the key is a string and the value is a string
COG has a value which is a reference to a hash where the key is a string and the value is a string
sims has a value which is a reference to a hash where the key is a string and the value is a string
order has a value which is a reference to a hash where the key is a string and the value is a string
Subsystem has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
kmer_15 has a value which is a reference to a hash where the key is a string and the value is a string
drisee_info has a value which is a reference to a hash where the key is a string and the value is a string
kmer_6 has a value which is a reference to a hash where the key is a string and the value is a string
KO has a value which is a reference to a hash where the key is a string and the value is a string
genus has a value which is a reference to a hash where the key is a string and the value is a string
species has a value which is a reference to a hash where the key is a string and the value is a string
consensus has a value which is a reference to a hash where the key is a string and the value is a string
preprocess_removed has a value which is a reference to a hash where the key is a string and the value is a string
rarefaction has a value which is a reference to a hash where the key is a string and the value is a string
phylum has a value which is a reference to a hash where the key is a string and the value is a string
class has a value which is a reference to a hash where the key is a string and the value is a string
preprocess_passed has a value which is a reference to a hash where the key is a string and the value is a string
dereplication_removed has a value which is a reference to a hash where the key is a string and the value is a string
family has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
basic has a value which is a reference to a hash where the key is a string and the value is a string
drisee_stats has a value which is a reference to a hash where the key is a string and the value is a string
dereplication_passed has a value which is a reference to a hash where the key is a string and the value is a string
NOG has a value which is a reference to a hash where the key is a string and the value is a string
domain has a value which is a reference to a hash where the key is a string and the value is a string
COG has a value which is a reference to a hash where the key is a string and the value is a string
sims has a value which is a reference to a hash where the key is a string and the value is a string
order has a value which is a reference to a hash where the key is a string and the value is a string
Subsystem has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
kmer_15 has a value which is a reference to a hash where the key is a string and the value is a string
drisee_info has a value which is a reference to a hash where the key is a string and the value is a string
kmer_6 has a value which is a reference to a hash where the key is a string and the value is a string
KO has a value which is a reference to a hash where the key is a string and the value is a string
genus has a value which is a reference to a hash where the key is a string and the value is a string
species has a value which is a reference to a hash where the key is a string and the value is a string
consensus has a value which is a reference to a hash where the key is a string and the value is a string
preprocess_removed has a value which is a reference to a hash where the key is a string and the value is a string
rarefaction has a value which is a reference to a hash where the key is a string and the value is a string
phylum has a value which is a reference to a hash where the key is a string and the value is a string
class has a value which is a reference to a hash where the key is a string and the value is a string
preprocess_passed has a value which is a reference to a hash where the key is a string and the value is a string
dereplication_removed has a value which is a reference to a hash where the key is a string and the value is a string
family has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_project_query_data_object

=over 4



=item Description

list of the project objects

int version: version of the object
string name: human readable identifier
string description: a short, comprehensive description of the project
string created: time the object was first created
string funding_source: the official name of the source of funding of this project
string url: resource location of this object instance
mapping<string, string> metadata: key value pairs describing metadata
string id: unique object identifier
string pi: the first and last name of the principal investigator of the project


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
name has a value which is a string
description has a value which is a string
created has a value which is a string
funding_source has a value which is a string
url has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
pi has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
name has a value which is a string
description has a value which is a string
created has a value which is a string
funding_source has a value which is a string
url has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string
pi has a value which is a string


=end text

=back



=head2 get_project_query_params

=over 4



=item Description

string verbosity: This parameter value can be chosen from the following (the first being default):

minimal - returns only minimal information
verbose - returns all metadata
full - returns all metadata and references

string order: This parameter value can be chosen from the following (the first being default):

id - return data objects ordered by id
name - return data objects ordered by name

int limit: maximum number of items requested

int offset: zero based index of the first data object to be returned


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

string next: link to the previous set or null if this is the first set

string prev: link to the next set or null if this is the last set

string order: name of the attribute the returned data is ordered by

int limit: maximum number of data items returned, default is 10

list<get_project_query_data_object> data: list of the project objects

int offset: zero based index of the first returned data item

int total_count: total number of available data items


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a get_project_query_data_object
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
data has a value which is a reference to a list where each element is a get_project_query_data_object
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 get_project_instance_params

=over 4



=item Description

string verbosity: This parameter value can be chosen from the following (the first being default):

minimal - returns only minimal information
verbose - returns all metadata
full - returns all metadata and references

string id: unique object identifier


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



=item Description

list<string> analyzed: a list of references to the related metagenome objects

int version: version of the object

string name: human readable identifier

string description: a short, comprehensive description of the project

list<string> libraries: a list of references to the related library objects

string created: time the object was first created

list<string> samples: a list of references to the related sample objects

string funding_source: the official name of the source of funding of this project

string url: resource location of this object instance

mapping<string, string> metadata: key value pairs describing metadata

string id: unique object identifier

string pi: the first and last name of the principal investigator of the project


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



=head2 get_sample_query_data_object

=over 4



=item Description

list of sample objects

int version: version of the object
string project: reference to the project of this sample
string name: human readable identifier
string created: time the object was first created
string url: resource location of this object instance
string id: unique object identifier
mapping<string, string> metadata: key value pairs describing metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
created has a value which is a string
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
created has a value which is a string
url has a value which is a string
id has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_sample_query_params

=over 4



=item Description

string order: This parameter value can be chosen from the following (the first being default):

id - return data objects ordered by id
name - return data objects ordered by name

int limit: maximum number of items requested

int offset: zero based index of the first data object to be returned


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

string next: link to the previous set or null if this is the first set

string prev: link to the next set or null if this is the last set

string order: name of the attribute the returned data is ordered by

int limit: maximum number of data items returned, default is 10

list<get_sample_query_data_object> data: list of sample objects

int offset: zero based index of the first returned data item

int total_count: total number of available data items


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
order has a value which is a string
limit has a value which is an int
data has a value which is a reference to a list where each element is a get_sample_query_data_object
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
data has a value which is a reference to a list where each element is a get_sample_query_data_object
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 get_sample_instance_env_package_object

=over 4



=item Description

environmental package object

string created: creation date
string name: name of the package
string id: unique package identifier
string type: package type
mapping<string, string> metadata: key value pairs describing metadata


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



=head2 get_sample_instance_params

=over 4



=item Description

string verbosity: This parameter value can be chosen from the following (the first being default):

minimal - returns only minimal information
verbose - returns all metadata
full - returns all metadata and references

string id: unique object identifier


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



=item Description

int version: version of the object

string project: reference to the project of this sample

string name: human readable identifier

list<string> metagenomes: a list of references to the related metagenome objects

list<string> libraries: a list of references to the related library objects

string created: time the object was first created

get_sample_instance_env_package_object env_package: environmental package object

string url: resource location of this object instance

string id: unique object identifier

mapping<string, string> metadata: key value pairs describing metadata


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
env_package has a value which is a get_sample_instance_env_package_object
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
env_package has a value which is a get_sample_instance_env_package_object
url has a value which is a string
id has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 get_sequences_md5_params

=over 4



=item Description

string id: unique metagenome identifier

string sequence_type: This parameter value can be chosen from the following (the first being default):

dna - return DNA sequences
protein - return protein sequences

list<string> md5: md5 identifier


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

int version: version of the object

string url: resource location of this object instance

list<mapping<string, string>> data: a hash of data_type to list of sequences

string id: unique object identifier


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

list<string> ontology: ontology to filter by

string source: This parameter value can be chosen from the following (the first being default):

RDP - RNA database, type organism and feature only
Greengenes - RNA database, type organism and feature only
LSU - RNA database, type organism and feature only
SSU - RNA database, type organism and feature only
SwissProt - protein database, type organism and feature only
GenBank - protein database, type organism and feature only
IMG - protein database, type organism and feature only
SEED - protein database, type organism and feature only
TrEMBL - protein database, type organism and feature only
RefSeq - protein database, type organism and feature only
PATRIC - protein database, type organism and feature only
eggNOG - protein database, type organism and feature only
KEGG - protein database, type organism and feature only
NOG - ontology database, type function only
COG - ontology database, type function only
KO - ontology database, type function only
GO - ontology database, type function only
Subsystems - ontology database, type function only

string data_type: This parameter value can be chosen from the following (the first being default):

organism - return organism data
function - return function data
ontology - return ontology data

list<string> function: function to filter by

string id: unique metagenome identifier

string sequence_type: This parameter value can be chosen from the following (the first being default):

dna - return DNA sequences
protein - return protein sequences

list<string> organism: organism to filter by


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
ontology has a value which is a reference to a list where each element is a string
source has a value which is a string
data_type has a value which is a string
function has a value which is a reference to a list where each element is a string
id has a value which is a string
sequence_type has a value which is a string
organism has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
ontology has a value which is a reference to a list where each element is a string
source has a value which is a string
data_type has a value which is a string
function has a value which is a reference to a list where each element is a string
id has a value which is a string
sequence_type has a value which is a string
organism has a value which is a reference to a list where each element is a string


=end text

=back



=head2 SequencesAnnotation

=over 4



=item Description

int version: version of the object

string url: resource location of this object instance

list<mapping<string, string>> data: a hash of data_type to list of sequences

string id: unique object identifier


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

string id: unique sequence set identifier - to get a list of all identifiers for a metagenome, use the setlist request


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

string data: requested sequence file


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



=head2 get_sequenceset_setlist_params

=over 4



=item Description

string id: unique metagenome identifier


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



=head2 SequencesetSetlist

=over 4



=item Description

string stage_name: name of the stage in processing of this sequence file

string file_name: name of the sequence file

string url: url for retrieving this sequence file

string id: unique identifier of the sequence file

string stage_type: type of the sequence file within a stage, i.e. passed or removed for quality control steps

string stage_id: three digit numerical identifier of the stage


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

1;
