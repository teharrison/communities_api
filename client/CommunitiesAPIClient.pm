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



=cut

sub new
{
    my($class, $url) = @_;

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




=head2 $result = get_abundanceprofile_instance(get_abundanceprofile_instance_params)

A profile in biom format that contains abundance counts
Returns a single data object.

=cut

sub get_abundanceprofile_instance
{
    my($self, @args) = @_;

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



=head2 $result = get_analysisset_instance(get_analysisset_instance_params)

An analysis file from the processing of a metagenome from a specific stage in its analysis
Returns a single sequence file.

=cut

sub get_analysisset_instance
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_analysisset_instance (received $n, expecting 1)");
    }
    {
	my($get_analysisset_instance_params) = @args;

	my @_bad_arguments;
        (ref($get_analysisset_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_analysisset_instance_params\" (value was \"$get_analysisset_instance_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_analysisset_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_analysisset_instance');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_analysisset_instance",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_analysisset_instance',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_analysisset_instance",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_analysisset_instance',
				       );
    }
}



=head2 $result = get_analysisset_setlist(get_analysisset_setlist_params)

An analysis file from the processing of a metagenome from a specific stage in its analysis
Returns a list of sets of sequence files for the given id.

=cut

sub get_analysisset_setlist
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_analysisset_setlist (received $n, expecting 1)");
    }
    {
	my($get_analysisset_setlist_params) = @args;

	my @_bad_arguments;
        (ref($get_analysisset_setlist_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_analysisset_setlist_params\" (value was \"$get_analysisset_setlist_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_analysisset_setlist:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_analysisset_setlist');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_analysisset_setlist",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_analysisset_setlist',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_analysisset_setlist",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_analysisset_setlist',
				       );
    }
}



=head2 $result = get_library_query(get_library_query_params)

A library of metagenomic samples from some environment
Returns a set of data matching the query criteria.

=cut

sub get_library_query
{
    my($self, @args) = @_;

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



=head2 $result = get_library_instance(get_library_instance_params)

A library of metagenomic samples from some environment
Returns a single data object.

=cut

sub get_library_instance
{
    my($self, @args) = @_;

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



=head2 $result = get_matrix_organism(get_matrix_organism_params)

A profile in biom format that contains abundance counts
Returns a single data object.

=cut

sub get_matrix_organism
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_matrix_organism (received $n, expecting 1)");
    }
    {
	my($get_matrix_organism_params) = @args;

	my @_bad_arguments;
        (ref($get_matrix_organism_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_matrix_organism_params\" (value was \"$get_matrix_organism_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_matrix_organism:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_matrix_organism');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_matrix_organism",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_matrix_organism',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_matrix_organism",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_matrix_organism',
				       );
    }
}



=head2 $result = get_matrix_function(get_matrix_function_params)

A profile in biom format that contains abundance counts
Returns a single data object.

=cut

sub get_matrix_function
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_matrix_function (received $n, expecting 1)");
    }
    {
	my($get_matrix_function_params) = @args;

	my @_bad_arguments;
        (ref($get_matrix_function_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_matrix_function_params\" (value was \"$get_matrix_function_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_matrix_function:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_matrix_function');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_matrix_function",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_matrix_function',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_matrix_function",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_matrix_function',
				       );
    }
}



=head2 $result = get_metagenome_query(get_metagenome_query_params)

A metagenome is an analyzed set sequences from a sample of some environment
Returns a set of data matching the query criteria.

=cut

sub get_metagenome_query
{
    my($self, @args) = @_;

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



=head2 $result = get_metagenome_instance(get_metagenome_instance_params)

A metagenome is an analyzed set sequences from a sample of some environment
Returns a single data object.

=cut

sub get_metagenome_instance
{
    my($self, @args) = @_;

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



=head2 $result = get_metagenome_statistics_instance(get_metagenome_statistics_instance_params)

An set of statistical information obtained during the analysis of a metagenomic sequence
Returns a JSON structure of statistical information.

=cut

sub get_metagenome_statistics_instance
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_metagenome_statistics_instance (received $n, expecting 1)");
    }
    {
	my($get_metagenome_statistics_instance_params) = @args;

	my @_bad_arguments;
        (ref($get_metagenome_statistics_instance_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_metagenome_statistics_instance_params\" (value was \"$get_metagenome_statistics_instance_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_metagenome_statistics_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_metagenome_statistics_instance');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_metagenome_statistics_instance",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_metagenome_statistics_instance',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_metagenome_statistics_instance",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_metagenome_statistics_instance',
				       );
    }
}



=head2 $result = get_project_query(get_project_query_params)

A project is a composition of samples, libraries and metagenomes being analyzed in a global context.
Returns a set of data matching the query criteria.

=cut

sub get_project_query
{
    my($self, @args) = @_;

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



=head2 $result = get_project_instance(get_project_instance_params)

A project is a composition of samples, libraries and metagenomes being analyzed in a global context.
Returns a single data object.

=cut

sub get_project_instance
{
    my($self, @args) = @_;

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



=head2 $result = get_sample_query(get_sample_query_params)

A metagenomic sample from some environment.
Returns a set of data matching the query criteria.

=cut

sub get_sample_query
{
    my($self, @args) = @_;

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



=head2 $result = get_sample_instance(get_sample_instance_params)

A metagenomic sample from some environment.
Returns a single data object.

=cut

sub get_sample_instance
{
    my($self, @args) = @_;

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



=head2 $result = get_sequences_md5(get_sequences_md5_params)

A set of genomic sequences of a metagenome annotated by a specified source
Returns a single data object.

=cut

sub get_sequences_md5
{
    my($self, @args) = @_;

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



=head2 $result = get_sequences_annotation(get_sequences_annotation_params)

A set of genomic sequences of a metagenome annotated by a specified source
Returns a single data object.

=cut

sub get_sequences_annotation
{
    my($self, @args) = @_;

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



=head2 $result = get_sequenceset_instance(get_sequenceset_instance_params)

A set / subset of genomic sequences of a metagenome from a specific stage in its analysis
Returns a single sequence file.

=cut

sub get_sequenceset_instance
{
    my($self, @args) = @_;

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



=head2 $result = get_sequenceset_setlist(get_sequenceset_setlist_params)

A set / subset of genomic sequences of a metagenome from a specific stage in its analysis
Returns a list of sets of sequence files for the given id.

=cut

sub get_sequenceset_setlist
{
    my($self, @args) = @_;

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_sequenceset_setlist (received $n, expecting 1)");
    }
    {
	my($get_sequenceset_setlist_params) = @args;

	my @_bad_arguments;
        (ref($get_sequenceset_setlist_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"get_sequenceset_setlist_params\" (value was \"$get_sequenceset_setlist_params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_sequenceset_setlist:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_sequenceset_setlist');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_sequenceset_setlist",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_sequenceset_setlist',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_sequenceset_setlist",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_sequenceset_setlist',
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
                method_name => 'get_sequenceset_setlist',
            );
        } else {
            return wantarray ? @{$result->result} : $result->result->[0];
        }
    } else {
        Bio::KBase::Exceptions::HTTP->throw(
            error => "Error invoking method get_sequenceset_setlist",
            status_line => $self->{client}->status_line,
            method_name => 'get_sequenceset_setlist',
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

1;
