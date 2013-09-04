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


RESTful Microbial Communities object and resource API
For usage note that required parameters need to be passed as path parameters, optional parameters need to be query parameters. If an optional parameter has a list of option values, the first displayed will be used as default.


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




=head2 post_compute_normalize

  $return = $obj->post_compute_normalize($PostComputeNormalizeParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostComputeNormalizeParams is a CommunitiesAPI.PostComputeNormalizeParams
$return is a CommunitiesAPI.ComputeNormalize
PostComputeNormalizeParams is a reference to a hash where the following keys are defined:
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is an int
	rows has a value which is a reference to a list where each element is a string
ComputeNormalize is a reference to a hash where the following keys are defined:
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

$PostComputeNormalizeParams is a CommunitiesAPI.PostComputeNormalizeParams
$return is a CommunitiesAPI.ComputeNormalize
PostComputeNormalizeParams is a reference to a hash where the following keys are defined:
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is an int
	rows has a value which is a reference to a list where each element is a string
ComputeNormalize is a reference to a hash where the following keys are defined:
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a string


=end text

=item Description

Calculate a PCoA for given input data.
Calculate normalized values for given input data.

=back

=cut

sub post_compute_normalize
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_compute_normalize (received $n, expecting 1)");
    }
    {
	my($PostComputeNormalizeParams) = @args;

	my @_bad_arguments;
        (ref($PostComputeNormalizeParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostComputeNormalizeParams\" (value was \"$PostComputeNormalizeParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_compute_normalize:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_compute_normalize');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_compute_normalize",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_compute_normalize',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_compute_normalize",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_compute_normalize',
				       );
    }
}



=head2 post_compute_heatmap

  $return = $obj->post_compute_heatmap($PostComputeHeatmapParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostComputeHeatmapParams is a CommunitiesAPI.PostComputeHeatmapParams
$return is a CommunitiesAPI.ComputeHeatmap
PostComputeHeatmapParams is a reference to a hash where the following keys are defined:
	cluster has a value which is a string
	distance has a value which is a string
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is an int
	rows has a value which is a reference to a list where each element is a string
	raw has a value which is an int
ComputeHeatmap is a reference to a hash where the following keys are defined:
	colindex has a value which is a reference to a list where each element is a float
	coldend has a value which is a reference to a hash where the key is a string and the value is a string
	rowindex has a value which is a reference to a list where each element is a float
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rowdend has a value which is a reference to a hash where the key is a string and the value is a string
	rows has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

$PostComputeHeatmapParams is a CommunitiesAPI.PostComputeHeatmapParams
$return is a CommunitiesAPI.ComputeHeatmap
PostComputeHeatmapParams is a reference to a hash where the following keys are defined:
	cluster has a value which is a string
	distance has a value which is a string
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is an int
	rows has a value which is a reference to a list where each element is a string
	raw has a value which is an int
ComputeHeatmap is a reference to a hash where the following keys are defined:
	colindex has a value which is a reference to a list where each element is a float
	coldend has a value which is a reference to a hash where the key is a string and the value is a string
	rowindex has a value which is a reference to a list where each element is a float
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rowdend has a value which is a reference to a hash where the key is a string and the value is a string
	rows has a value which is a reference to a list where each element is a string


=end text

=item Description

Calculate a PCoA for given input data.
Calculate a dendogram for given input data.

=back

=cut

sub post_compute_heatmap
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_compute_heatmap (received $n, expecting 1)");
    }
    {
	my($PostComputeHeatmapParams) = @args;

	my @_bad_arguments;
        (ref($PostComputeHeatmapParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostComputeHeatmapParams\" (value was \"$PostComputeHeatmapParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_compute_heatmap:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_compute_heatmap');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_compute_heatmap",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_compute_heatmap',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_compute_heatmap",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_compute_heatmap',
				       );
    }
}



=head2 post_compute_pcoa

  $return = $obj->post_compute_pcoa($PostComputePcoaParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostComputePcoaParams is a CommunitiesAPI.PostComputePcoaParams
$return is a CommunitiesAPI.ComputePcoa
PostComputePcoaParams is a reference to a hash where the following keys are defined:
	distance has a value which is a string
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is an int
	rows has a value which is a reference to a list where each element is a string
	raw has a value which is an int
ComputePcoa is a reference to a hash where the following keys are defined:
	pco has a value which is a reference to a list where each element is a float
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$PostComputePcoaParams is a CommunitiesAPI.PostComputePcoaParams
$return is a CommunitiesAPI.ComputePcoa
PostComputePcoaParams is a reference to a hash where the following keys are defined:
	distance has a value which is a string
	columns has a value which is a reference to a list where each element is a string
	data has a value which is a reference to a list where each element is an int
	rows has a value which is a reference to a list where each element is a string
	raw has a value which is an int
ComputePcoa is a reference to a hash where the following keys are defined:
	pco has a value which is a reference to a list where each element is a float
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string


=end text

=item Description

Calculate a PCoA for given input data.
Calculate a PCoA for given input data.

=back

=cut

sub post_compute_pcoa
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_compute_pcoa (received $n, expecting 1)");
    }
    {
	my($PostComputePcoaParams) = @args;

	my @_bad_arguments;
        (ref($PostComputePcoaParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostComputePcoaParams\" (value was \"$PostComputePcoaParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_compute_pcoa:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_compute_pcoa');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_compute_pcoa",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_compute_pcoa',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_compute_pcoa",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_compute_pcoa',
				       );
    }
}



=head2 get_download_instance

  $return = $obj->get_download_instance($GetDownloadInstanceParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetDownloadInstanceParams is a CommunitiesAPI.GetDownloadInstanceParams
$return is a CommunitiesAPI.DownloadInstance
GetDownloadInstanceParams is a reference to a hash where the following keys are defined:
	file has a value which is a string
	id has a value which is a string
DownloadInstance is a reference to a hash where the following keys are defined:
	data has a value which is a string

</pre>

=end html

=begin text

$GetDownloadInstanceParams is a CommunitiesAPI.GetDownloadInstanceParams
$return is a CommunitiesAPI.DownloadInstance
GetDownloadInstanceParams is a reference to a hash where the following keys are defined:
	file has a value which is a string
	id has a value which is a string
DownloadInstance is a reference to a hash where the following keys are defined:
	data has a value which is a string


=end text

=item Description

An analysis file from the processing of a metagenome from a specific stage in its analysis
Returns a single sequence file.

=back

=cut

sub get_download_instance
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_download_instance (received $n, expecting 1)");
    }
    {
	my($GetDownloadInstanceParams) = @args;

	my @_bad_arguments;
        (ref($GetDownloadInstanceParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetDownloadInstanceParams\" (value was \"$GetDownloadInstanceParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_download_instance:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_download_instance');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_download_instance",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_download_instance',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_download_instance",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_download_instance',
				       );
    }
}



=head2 get_download_setlist

  $return = $obj->get_download_setlist($GetDownloadSetlistParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetDownloadSetlistParams is a CommunitiesAPI.GetDownloadSetlistParams
$return is a CommunitiesAPI.DownloadSetlist
GetDownloadSetlistParams is a reference to a hash where the following keys are defined:
	stage has a value which is a string
	id has a value which is a string
DownloadSetlist is a reference to a hash where the following keys are defined:
	stage_name has a value which is a string
	file_name has a value which is a string
	url has a value which is a string
	id has a value which is a string
	file_id has a value which is a string
	stage_type has a value which is a string
	stage_id has a value which is a string

</pre>

=end html

=begin text

$GetDownloadSetlistParams is a CommunitiesAPI.GetDownloadSetlistParams
$return is a CommunitiesAPI.DownloadSetlist
GetDownloadSetlistParams is a reference to a hash where the following keys are defined:
	stage has a value which is a string
	id has a value which is a string
DownloadSetlist is a reference to a hash where the following keys are defined:
	stage_name has a value which is a string
	file_name has a value which is a string
	url has a value which is a string
	id has a value which is a string
	file_id has a value which is a string
	stage_type has a value which is a string
	stage_id has a value which is a string


=end text

=item Description

An analysis file from the processing of a metagenome from a specific stage in its analysis
Returns a list of sets of sequence files for the given id.

=back

=cut

sub get_download_setlist
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_download_setlist (received $n, expecting 1)");
    }
    {
	my($GetDownloadSetlistParams) = @args;

	my @_bad_arguments;
        (ref($GetDownloadSetlistParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetDownloadSetlistParams\" (value was \"$GetDownloadSetlistParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_download_setlist:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_download_setlist');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_download_setlist",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_download_setlist',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_download_setlist",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_download_setlist',
				       );
    }
}



=head2 get_inbox_view

  $return = $obj->get_inbox_view($GetInboxViewParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetInboxViewParams is a CommunitiesAPI.GetInboxViewParams
$return is a CommunitiesAPI.InboxView
GetInboxViewParams is a reference to a hash where the following keys are defined:
	auth has a value which is a string
InboxView is a reference to a hash where the following keys are defined:
	timestamp has a value which is a string
	files has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	id has a value which is a string

</pre>

=end html

=begin text

$GetInboxViewParams is a CommunitiesAPI.GetInboxViewParams
$return is a CommunitiesAPI.InboxView
GetInboxViewParams is a reference to a hash where the following keys are defined:
	auth has a value which is a string
InboxView is a reference to a hash where the following keys are defined:
	timestamp has a value which is a string
	files has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	id has a value which is a string


=end text

=item Description

inbox receives user inbox data upload, requires authentication, see http://blog.metagenomics.anl.gov/mg-rast-v3-2-faq/#api_submission for details
lists the contents of the user inbox

=back

=cut

sub get_inbox_view
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_inbox_view (received $n, expecting 1)");
    }
    {
	my($GetInboxViewParams) = @args;

	my @_bad_arguments;
        (ref($GetInboxViewParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetInboxViewParams\" (value was \"$GetInboxViewParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_inbox_view:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_inbox_view');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_inbox_view",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_inbox_view',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_inbox_view",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_inbox_view',
				       );
    }
}



=head2 post_inbox_upload

  $return = $obj->post_inbox_upload($PostInboxUploadParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostInboxUploadParams is a CommunitiesAPI.PostInboxUploadParams
$return is a CommunitiesAPI.InboxUpload
PostInboxUploadParams is a reference to a hash where the following keys are defined:
	auth has a value which is a string
	upload has a value which is a string
InboxUpload is a reference to a hash where the following keys are defined:
	timestamp has a value which is a string
	status has a value which is a string
	id has a value which is a string

</pre>

=end html

=begin text

$PostInboxUploadParams is a CommunitiesAPI.PostInboxUploadParams
$return is a CommunitiesAPI.InboxUpload
PostInboxUploadParams is a reference to a hash where the following keys are defined:
	auth has a value which is a string
	upload has a value which is a string
InboxUpload is a reference to a hash where the following keys are defined:
	timestamp has a value which is a string
	status has a value which is a string
	id has a value which is a string


=end text

=item Description

inbox receives user inbox data upload, requires authentication, see http://blog.metagenomics.anl.gov/mg-rast-v3-2-faq/#api_submission for details
receives user inbox data upload

=back

=cut

sub post_inbox_upload
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_inbox_upload (received $n, expecting 1)");
    }
    {
	my($PostInboxUploadParams) = @args;

	my @_bad_arguments;
        (ref($PostInboxUploadParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostInboxUploadParams\" (value was \"$PostInboxUploadParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_inbox_upload:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_inbox_upload');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_inbox_upload",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_inbox_upload',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_inbox_upload",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_inbox_upload',
				       );
    }
}



=head2 get_library_query

  $return = $obj->get_library_query($GetLibraryQueryParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetLibraryQueryParams is a CommunitiesAPI.GetLibraryQueryParams
$return is a CommunitiesAPI.LibraryQuery
GetLibraryQueryParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
LibraryQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	offset has a value which is an int
	total_count has a value which is an int

</pre>

=end html

=begin text

$GetLibraryQueryParams is a CommunitiesAPI.GetLibraryQueryParams
$return is a CommunitiesAPI.LibraryQuery
GetLibraryQueryParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
LibraryQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	offset has a value which is an int
	total_count has a value which is an int


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
	my($GetLibraryQueryParams) = @args;

	my @_bad_arguments;
        (ref($GetLibraryQueryParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetLibraryQueryParams\" (value was \"$GetLibraryQueryParams\")");
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

  $return = $obj->get_library_instance($GetLibraryInstanceParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetLibraryInstanceParams is a CommunitiesAPI.GetLibraryInstanceParams
$return is a CommunitiesAPI.LibraryInstance
GetLibraryInstanceParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
LibraryInstance is a reference to a hash where the following keys are defined:
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

$GetLibraryInstanceParams is a CommunitiesAPI.GetLibraryInstanceParams
$return is a CommunitiesAPI.LibraryInstance
GetLibraryInstanceParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
LibraryInstance is a reference to a hash where the following keys are defined:
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
	my($GetLibraryInstanceParams) = @args;

	my @_bad_arguments;
        (ref($GetLibraryInstanceParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetLibraryInstanceParams\" (value was \"$GetLibraryInstanceParams\")");
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



=head2 get_m5nr_ontology

  $return = $obj->get_m5nr_ontology($GetM5nrOntologyParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetM5nrOntologyParams is a CommunitiesAPI.GetM5nrOntologyParams
$return is a CommunitiesAPI.M5nrOntology
GetM5nrOntologyParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	parent_name has a value which is a string
	id_map has a value which is an int
	min_level has a value which is a string
M5nrOntology is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

$GetM5nrOntologyParams is a CommunitiesAPI.GetM5nrOntologyParams
$return is a CommunitiesAPI.M5nrOntology
GetM5nrOntologyParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	parent_name has a value which is a string
	id_map has a value which is an int
	min_level has a value which is a string
M5nrOntology is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a list where each element is a string


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return functional hierarchy

=back

=cut

sub get_m5nr_ontology
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_m5nr_ontology (received $n, expecting 1)");
    }
    {
	my($GetM5nrOntologyParams) = @args;

	my @_bad_arguments;
        (ref($GetM5nrOntologyParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetM5nrOntologyParams\" (value was \"$GetM5nrOntologyParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_m5nr_ontology:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_m5nr_ontology');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_m5nr_ontology",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_m5nr_ontology',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_m5nr_ontology",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_m5nr_ontology',
				       );
    }
}



=head2 get_m5nr_taxonomy

  $return = $obj->get_m5nr_taxonomy($GetM5nrTaxonomyParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetM5nrTaxonomyParams is a CommunitiesAPI.GetM5nrTaxonomyParams
$return is a CommunitiesAPI.M5nrTaxonomy
GetM5nrTaxonomyParams is a reference to a hash where the following keys are defined:
	parent_name has a value which is a string
	id_map has a value which is an int
	min_level has a value which is a string
M5nrTaxonomy is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

$GetM5nrTaxonomyParams is a CommunitiesAPI.GetM5nrTaxonomyParams
$return is a CommunitiesAPI.M5nrTaxonomy
GetM5nrTaxonomyParams is a reference to a hash where the following keys are defined:
	parent_name has a value which is a string
	id_map has a value which is an int
	min_level has a value which is a string
M5nrTaxonomy is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a list where each element is a string


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return organism hierarchy

=back

=cut

sub get_m5nr_taxonomy
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_m5nr_taxonomy (received $n, expecting 1)");
    }
    {
	my($GetM5nrTaxonomyParams) = @args;

	my @_bad_arguments;
        (ref($GetM5nrTaxonomyParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetM5nrTaxonomyParams\" (value was \"$GetM5nrTaxonomyParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_m5nr_taxonomy:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_m5nr_taxonomy');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_m5nr_taxonomy",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_m5nr_taxonomy',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_m5nr_taxonomy",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_m5nr_taxonomy',
				       );
    }
}



=head2 get_m5nr_sources

  $return = $obj->get_m5nr_sources()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a CommunitiesAPI.M5nrSources
M5nrSources is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$return is a CommunitiesAPI.M5nrSources
M5nrSources is a reference to a hash where the following keys are defined:
	version has a value which is an int
	url has a value which is a string
	data has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return all sources in M5NR

=back

=cut

sub get_m5nr_sources
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 0)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_m5nr_sources (received $n, expecting 0)");
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_m5nr_sources",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_m5nr_sources',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_m5nr_sources",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_m5nr_sources',
				       );
    }
}



=head2 get_m5nr_accession

  $return = $obj->get_m5nr_accession($GetM5nrAccessionParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetM5nrAccessionParams is a CommunitiesAPI.GetM5nrAccessionParams
$return is a CommunitiesAPI.M5nrAccession
GetM5nrAccessionParams is a reference to a hash where the following keys are defined:
	sequence has a value which is an int
	order has a value which is a string
	id has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrAccession is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$GetM5nrAccessionParams is a CommunitiesAPI.GetM5nrAccessionParams
$return is a CommunitiesAPI.M5nrAccession
GetM5nrAccessionParams is a reference to a hash where the following keys are defined:
	sequence has a value which is an int
	order has a value which is a string
	id has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrAccession is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotation or sequence of given source protein ID

=back

=cut

sub get_m5nr_accession
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_m5nr_accession (received $n, expecting 1)");
    }
    {
	my($GetM5nrAccessionParams) = @args;

	my @_bad_arguments;
        (ref($GetM5nrAccessionParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetM5nrAccessionParams\" (value was \"$GetM5nrAccessionParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_m5nr_accession:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_m5nr_accession');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_m5nr_accession",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_m5nr_accession',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_m5nr_accession",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_m5nr_accession',
				       );
    }
}



=head2 get_m5nr_md5

  $return = $obj->get_m5nr_md5($GetM5nrMd5Params)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetM5nrMd5Params is a CommunitiesAPI.GetM5nrMd5Params
$return is a CommunitiesAPI.M5nrMd5
GetM5nrMd5Params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	sequence has a value which is an int
	order has a value which is a string
	id has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrMd5 is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$GetM5nrMd5Params is a CommunitiesAPI.GetM5nrMd5Params
$return is a CommunitiesAPI.M5nrMd5
GetM5nrMd5Params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	sequence has a value which is an int
	order has a value which is a string
	id has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrMd5 is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotation(s) or sequence of given md5sum (M5NR ID)

=back

=cut

sub get_m5nr_md5
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_m5nr_md5 (received $n, expecting 1)");
    }
    {
	my($GetM5nrMd5Params) = @args;

	my @_bad_arguments;
        (ref($GetM5nrMd5Params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetM5nrMd5Params\" (value was \"$GetM5nrMd5Params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_m5nr_md5:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_m5nr_md5');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_m5nr_md5",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_m5nr_md5',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_m5nr_md5",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_m5nr_md5',
				       );
    }
}



=head2 get_m5nr_function

  $return = $obj->get_m5nr_function($GetM5nrFunctionParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetM5nrFunctionParams is a CommunitiesAPI.GetM5nrFunctionParams
$return is a CommunitiesAPI.M5nrFunction
GetM5nrFunctionParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	text has a value which is a string
	order has a value which is a string
	exact has a value which is an int
	limit has a value which is an int
	offset has a value which is an int
M5nrFunction is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$GetM5nrFunctionParams is a CommunitiesAPI.GetM5nrFunctionParams
$return is a CommunitiesAPI.M5nrFunction
GetM5nrFunctionParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	text has a value which is a string
	order has a value which is a string
	exact has a value which is an int
	limit has a value which is an int
	offset has a value which is an int
M5nrFunction is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotations for function names containing the given text

=back

=cut

sub get_m5nr_function
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_m5nr_function (received $n, expecting 1)");
    }
    {
	my($GetM5nrFunctionParams) = @args;

	my @_bad_arguments;
        (ref($GetM5nrFunctionParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetM5nrFunctionParams\" (value was \"$GetM5nrFunctionParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_m5nr_function:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_m5nr_function');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_m5nr_function",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_m5nr_function',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_m5nr_function",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_m5nr_function',
				       );
    }
}



=head2 get_m5nr_organism

  $return = $obj->get_m5nr_organism($GetM5nrOrganismParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetM5nrOrganismParams is a CommunitiesAPI.GetM5nrOrganismParams
$return is a CommunitiesAPI.M5nrOrganism
GetM5nrOrganismParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	text has a value which is a string
	order has a value which is a string
	exact has a value which is an int
	limit has a value which is an int
	offset has a value which is an int
M5nrOrganism is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$GetM5nrOrganismParams is a CommunitiesAPI.GetM5nrOrganismParams
$return is a CommunitiesAPI.M5nrOrganism
GetM5nrOrganismParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	text has a value which is a string
	order has a value which is a string
	exact has a value which is an int
	limit has a value which is an int
	offset has a value which is an int
M5nrOrganism is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotations for organism names containing the given text

=back

=cut

sub get_m5nr_organism
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_m5nr_organism (received $n, expecting 1)");
    }
    {
	my($GetM5nrOrganismParams) = @args;

	my @_bad_arguments;
        (ref($GetM5nrOrganismParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetM5nrOrganismParams\" (value was \"$GetM5nrOrganismParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_m5nr_organism:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_m5nr_organism');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_m5nr_organism",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_m5nr_organism',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_m5nr_organism",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_m5nr_organism',
				       );
    }
}



=head2 get_m5nr_sequence

  $return = $obj->get_m5nr_sequence($GetM5nrSequenceParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetM5nrSequenceParams is a CommunitiesAPI.GetM5nrSequenceParams
$return is a CommunitiesAPI.M5nrSequence
GetM5nrSequenceParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	text has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrSequence is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$GetM5nrSequenceParams is a CommunitiesAPI.GetM5nrSequenceParams
$return is a CommunitiesAPI.M5nrSequence
GetM5nrSequenceParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	text has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrSequence is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotation(s) for md5sum (M5NR ID) of given sequence

=back

=cut

sub get_m5nr_sequence
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_m5nr_sequence (received $n, expecting 1)");
    }
    {
	my($GetM5nrSequenceParams) = @args;

	my @_bad_arguments;
        (ref($GetM5nrSequenceParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetM5nrSequenceParams\" (value was \"$GetM5nrSequenceParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_m5nr_sequence:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_m5nr_sequence');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_m5nr_sequence",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_m5nr_sequence',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_m5nr_sequence",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_m5nr_sequence',
				       );
    }
}



=head2 post_m5nr_accession

  $return = $obj->post_m5nr_accession($PostM5nrAccessionParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostM5nrAccessionParams is a CommunitiesAPI.PostM5nrAccessionParams
$return is a CommunitiesAPI.M5nrAccession
PostM5nrAccessionParams is a reference to a hash where the following keys are defined:
	order has a value which is a string
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrAccession is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$PostM5nrAccessionParams is a CommunitiesAPI.PostM5nrAccessionParams
$return is a CommunitiesAPI.M5nrAccession
PostM5nrAccessionParams is a reference to a hash where the following keys are defined:
	order has a value which is a string
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrAccession is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotations of given source protein IDs

=back

=cut

sub post_m5nr_accession
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_m5nr_accession (received $n, expecting 1)");
    }
    {
	my($PostM5nrAccessionParams) = @args;

	my @_bad_arguments;
        (ref($PostM5nrAccessionParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostM5nrAccessionParams\" (value was \"$PostM5nrAccessionParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_m5nr_accession:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_m5nr_accession');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_m5nr_accession",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_m5nr_accession',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_m5nr_accession",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_m5nr_accession',
				       );
    }
}



=head2 post_m5nr_md5

  $return = $obj->post_m5nr_md5($PostM5nrMd5Params)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostM5nrMd5Params is a CommunitiesAPI.PostM5nrMd5Params
$return is a CommunitiesAPI.M5nrMd5
PostM5nrMd5Params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	order has a value which is a string
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrMd5 is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$PostM5nrMd5Params is a CommunitiesAPI.PostM5nrMd5Params
$return is a CommunitiesAPI.M5nrMd5
PostM5nrMd5Params is a reference to a hash where the following keys are defined:
	source has a value which is a string
	order has a value which is a string
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrMd5 is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotations of given md5sums (M5NR ID)

=back

=cut

sub post_m5nr_md5
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_m5nr_md5 (received $n, expecting 1)");
    }
    {
	my($PostM5nrMd5Params) = @args;

	my @_bad_arguments;
        (ref($PostM5nrMd5Params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostM5nrMd5Params\" (value was \"$PostM5nrMd5Params\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_m5nr_md5:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_m5nr_md5');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_m5nr_md5",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_m5nr_md5',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_m5nr_md5",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_m5nr_md5',
				       );
    }
}



=head2 post_m5nr_function

  $return = $obj->post_m5nr_function($PostM5nrFunctionParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostM5nrFunctionParams is a CommunitiesAPI.PostM5nrFunctionParams
$return is a CommunitiesAPI.M5nrFunction
PostM5nrFunctionParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	order has a value which is a string
	exact has a value which is an int
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrFunction is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$PostM5nrFunctionParams is a CommunitiesAPI.PostM5nrFunctionParams
$return is a CommunitiesAPI.M5nrFunction
PostM5nrFunctionParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	order has a value which is a string
	exact has a value which is an int
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrFunction is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotations for function names containing the given texts

=back

=cut

sub post_m5nr_function
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_m5nr_function (received $n, expecting 1)");
    }
    {
	my($PostM5nrFunctionParams) = @args;

	my @_bad_arguments;
        (ref($PostM5nrFunctionParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostM5nrFunctionParams\" (value was \"$PostM5nrFunctionParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_m5nr_function:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_m5nr_function');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_m5nr_function",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_m5nr_function',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_m5nr_function",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_m5nr_function',
				       );
    }
}



=head2 post_m5nr_organism

  $return = $obj->post_m5nr_organism($PostM5nrOrganismParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostM5nrOrganismParams is a CommunitiesAPI.PostM5nrOrganismParams
$return is a CommunitiesAPI.M5nrOrganism
PostM5nrOrganismParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	order has a value which is a string
	exact has a value which is an int
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrOrganism is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$PostM5nrOrganismParams is a CommunitiesAPI.PostM5nrOrganismParams
$return is a CommunitiesAPI.M5nrOrganism
PostM5nrOrganismParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	order has a value which is a string
	exact has a value which is an int
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrOrganism is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotations for organism names containing the given texts

=back

=cut

sub post_m5nr_organism
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_m5nr_organism (received $n, expecting 1)");
    }
    {
	my($PostM5nrOrganismParams) = @args;

	my @_bad_arguments;
        (ref($PostM5nrOrganismParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostM5nrOrganismParams\" (value was \"$PostM5nrOrganismParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_m5nr_organism:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_m5nr_organism');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_m5nr_organism",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_m5nr_organism',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_m5nr_organism",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_m5nr_organism',
				       );
    }
}



=head2 post_m5nr_sequence

  $return = $obj->post_m5nr_sequence($PostM5nrSequenceParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostM5nrSequenceParams is a CommunitiesAPI.PostM5nrSequenceParams
$return is a CommunitiesAPI.M5nrSequence
PostM5nrSequenceParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	order has a value which is a string
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrSequence is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$PostM5nrSequenceParams is a CommunitiesAPI.PostM5nrSequenceParams
$return is a CommunitiesAPI.M5nrSequence
PostM5nrSequenceParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	order has a value which is a string
	data has a value which is a reference to a list where each element is a string
	limit has a value which is an int
	offset has a value which is an int
M5nrSequence is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


=end text

=item Description

M5NR provides data through a comprehensive non-redundant protein / rRNA database
Return annotations for md5s (M5NR ID) of given sequences

=back

=cut

sub post_m5nr_sequence
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_m5nr_sequence (received $n, expecting 1)");
    }
    {
	my($PostM5nrSequenceParams) = @args;

	my @_bad_arguments;
        (ref($PostM5nrSequenceParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostM5nrSequenceParams\" (value was \"$PostM5nrSequenceParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_m5nr_sequence:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_m5nr_sequence');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_m5nr_sequence",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_m5nr_sequence',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_m5nr_sequence",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_m5nr_sequence',
				       );
    }
}



=head2 get_matrix_organism

  $return = $obj->get_matrix_organism($GetMatrixOrganismParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetMatrixOrganismParams is a CommunitiesAPI.GetMatrixOrganismParams
$return is a CommunitiesAPI.MatrixOrganism
GetMatrixOrganismParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	asynchronous has a value which is an int
	result_type has a value which is a string
	filter has a value which is a string
	group_level has a value which is a string
	taxid has a value which is an int
	grep has a value which is a string
	length has a value which is an int
	identity has a value which is an int
	evalue has a value which is an int
	filter_source has a value which is a string
	id has a value which is a string
	hide_metadata has a value which is an int
	hit_type has a value which is a string
	filter_level has a value which is a string
MatrixOrganism is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	shape has a value which is a reference to a list where each element is an int
	id has a value which is a string
	type has a value which is a string

</pre>

=end html

=begin text

$GetMatrixOrganismParams is a CommunitiesAPI.GetMatrixOrganismParams
$return is a CommunitiesAPI.MatrixOrganism
GetMatrixOrganismParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	asynchronous has a value which is an int
	result_type has a value which is a string
	filter has a value which is a string
	group_level has a value which is a string
	taxid has a value which is an int
	grep has a value which is a string
	length has a value which is an int
	identity has a value which is an int
	evalue has a value which is an int
	filter_source has a value which is a string
	id has a value which is a string
	hide_metadata has a value which is an int
	hit_type has a value which is a string
	filter_level has a value which is a string
MatrixOrganism is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	shape has a value which is a reference to a list where each element is an int
	id has a value which is a string
	type has a value which is a string


=end text

=item Description

A profile in biom format that contains abundance counts
Returns a BIOM object.

=back

=cut

sub get_matrix_organism
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_matrix_organism (received $n, expecting 1)");
    }
    {
	my($GetMatrixOrganismParams) = @args;

	my @_bad_arguments;
        (ref($GetMatrixOrganismParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetMatrixOrganismParams\" (value was \"$GetMatrixOrganismParams\")");
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



=head2 get_matrix_function

  $return = $obj->get_matrix_function($GetMatrixFunctionParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetMatrixFunctionParams is a CommunitiesAPI.GetMatrixFunctionParams
$return is a CommunitiesAPI.MatrixFunction
GetMatrixFunctionParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	asynchronous has a value which is an int
	result_type has a value which is a string
	filter has a value which is a string
	group_level has a value which is a string
	grep has a value which is a string
	length has a value which is an int
	identity has a value which is an int
	evalue has a value which is an int
	filter_source has a value which is a string
	id has a value which is a string
	hide_metadata has a value which is an int
	filter_level has a value which is a string
MatrixFunction is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	shape has a value which is a reference to a list where each element is an int
	id has a value which is a string
	type has a value which is a string

</pre>

=end html

=begin text

$GetMatrixFunctionParams is a CommunitiesAPI.GetMatrixFunctionParams
$return is a CommunitiesAPI.MatrixFunction
GetMatrixFunctionParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	asynchronous has a value which is an int
	result_type has a value which is a string
	filter has a value which is a string
	group_level has a value which is a string
	grep has a value which is a string
	length has a value which is an int
	identity has a value which is an int
	evalue has a value which is an int
	filter_source has a value which is a string
	id has a value which is a string
	hide_metadata has a value which is an int
	filter_level has a value which is a string
MatrixFunction is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	shape has a value which is a reference to a list where each element is an int
	id has a value which is a string
	type has a value which is a string


=end text

=item Description

A profile in biom format that contains abundance counts
Returns a BIOM object.

=back

=cut

sub get_matrix_function
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_matrix_function (received $n, expecting 1)");
    }
    {
	my($GetMatrixFunctionParams) = @args;

	my @_bad_arguments;
        (ref($GetMatrixFunctionParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetMatrixFunctionParams\" (value was \"$GetMatrixFunctionParams\")");
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



=head2 get_matrix_feature

  $return = $obj->get_matrix_feature($GetMatrixFeatureParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetMatrixFeatureParams is a CommunitiesAPI.GetMatrixFeatureParams
$return is a CommunitiesAPI.MatrixFeature
GetMatrixFeatureParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	asynchronous has a value which is an int
	result_type has a value which is a string
	grep has a value which is a string
	length has a value which is an int
	evalue has a value which is an int
	identity has a value which is an int
	id has a value which is a string
	hide_metadata has a value which is an int
MatrixFeature is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	shape has a value which is a reference to a list where each element is an int
	id has a value which is a string
	type has a value which is a string

</pre>

=end html

=begin text

$GetMatrixFeatureParams is a CommunitiesAPI.GetMatrixFeatureParams
$return is a CommunitiesAPI.MatrixFeature
GetMatrixFeatureParams is a reference to a hash where the following keys are defined:
	source has a value which is a string
	asynchronous has a value which is an int
	result_type has a value which is a string
	grep has a value which is a string
	length has a value which is an int
	evalue has a value which is an int
	identity has a value which is an int
	id has a value which is a string
	hide_metadata has a value which is an int
MatrixFeature is a reference to a hash where the following keys are defined:
	generated_by has a value which is a string
	matrix_type has a value which is a string
	date has a value which is a string
	data has a value which is a reference to a list where each element is a reference to a list where each element is a float
	rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	matrix_element_value has a value which is a string
	matrix_element_type has a value which is a string
	format_url has a value which is a string
	format has a value which is a string
	columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	shape has a value which is a reference to a list where each element is an int
	id has a value which is a string
	type has a value which is a string


=end text

=item Description

A profile in biom format that contains abundance counts
Returns a BIOM object.

=back

=cut

sub get_matrix_feature
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_matrix_feature (received $n, expecting 1)");
    }
    {
	my($GetMatrixFeatureParams) = @args;

	my @_bad_arguments;
        (ref($GetMatrixFeatureParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetMatrixFeatureParams\" (value was \"$GetMatrixFeatureParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_matrix_feature:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_matrix_feature');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_matrix_feature",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_matrix_feature',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_matrix_feature",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_matrix_feature',
				       );
    }
}



=head2 get_metadata_template

  $return = $obj->get_metadata_template()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a CommunitiesAPI.MetadataTemplate
MetadataTemplate is a reference to a hash where the following keys are defined:
	ep has a value which is a reference to a hash where the key is a string and the value is a string
	project has a value which is a reference to a hash where the key is a string and the value is a string
	library has a value which is a reference to a hash where the key is a string and the value is a string
	sample has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$return is a CommunitiesAPI.MetadataTemplate
MetadataTemplate is a reference to a hash where the following keys are defined:
	ep has a value which is a reference to a hash where the key is a string and the value is a string
	project has a value which is a reference to a hash where the key is a string and the value is a string
	library has a value which is a reference to a hash where the key is a string and the value is a string
	sample has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=item Description

Metagenomic metadata is data providing information about one or more aspects of a set sequences from a sample of some environment
Returns static template for metadata object relationships and types

=back

=cut

sub get_metadata_template
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 0)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_metadata_template (received $n, expecting 0)");
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_metadata_template",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_metadata_template',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_metadata_template",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_metadata_template',
				       );
    }
}



=head2 get_metadata_cv

  $return = $obj->get_metadata_cv()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a CommunitiesAPI.MetadataCv
MetadataCv is a reference to a hash where the following keys are defined:
	ontology has a value which is a reference to a hash where the key is a string and the value is a string
	ont_id has a value which is a reference to a hash where the key is a string and the value is a string
	select has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$return is a CommunitiesAPI.MetadataCv
MetadataCv is a reference to a hash where the following keys are defined:
	ontology has a value which is a reference to a hash where the key is a string and the value is a string
	ont_id has a value which is a reference to a hash where the key is a string and the value is a string
	select has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=item Description

Metagenomic metadata is data providing information about one or more aspects of a set sequences from a sample of some environment
Returns static controlled vocabularies used in metadata

=back

=cut

sub get_metadata_cv
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 0)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_metadata_cv (received $n, expecting 0)");
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_metadata_cv",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_metadata_cv',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_metadata_cv",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_metadata_cv',
				       );
    }
}



=head2 get_metadata_export

  $return = $obj->get_metadata_export($GetMetadataExportParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetMetadataExportParams is a CommunitiesAPI.GetMetadataExportParams
$return is a CommunitiesAPI.MetadataExport
GetMetadataExportParams is a reference to a hash where the following keys are defined:
	id has a value which is a string
MetadataExport is a reference to a hash where the following keys are defined:
	sampleNum has a value which is an int
	samples has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	name has a value which is a string
	data has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string

</pre>

=end html

=begin text

$GetMetadataExportParams is a CommunitiesAPI.GetMetadataExportParams
$return is a CommunitiesAPI.MetadataExport
GetMetadataExportParams is a reference to a hash where the following keys are defined:
	id has a value which is a string
MetadataExport is a reference to a hash where the following keys are defined:
	sampleNum has a value which is an int
	samples has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	name has a value which is a string
	data has a value which is a reference to a hash where the key is a string and the value is a string
	id has a value which is a string


=end text

=item Description

Metagenomic metadata is data providing information about one or more aspects of a set sequences from a sample of some environment
Returns full nested metadata for a project in same format as template

=back

=cut

sub get_metadata_export
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_metadata_export (received $n, expecting 1)");
    }
    {
	my($GetMetadataExportParams) = @args;

	my @_bad_arguments;
        (ref($GetMetadataExportParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetMetadataExportParams\" (value was \"$GetMetadataExportParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_metadata_export:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_metadata_export');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_metadata_export",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_metadata_export',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_metadata_export",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_metadata_export',
				       );
    }
}



=head2 post_metadata_validate

  $return = $obj->post_metadata_validate($PostMetadataValidateParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$PostMetadataValidateParams is a CommunitiesAPI.PostMetadataValidateParams
$return is a CommunitiesAPI.MetadataValidate
PostMetadataValidateParams is a reference to a hash where the following keys are defined:
	upload has a value which is a string
MetadataValidate is a reference to a hash where the following keys are defined:
	message has a value which is a string
	is_valid has a value which is an int

</pre>

=end html

=begin text

$PostMetadataValidateParams is a CommunitiesAPI.PostMetadataValidateParams
$return is a CommunitiesAPI.MetadataValidate
PostMetadataValidateParams is a reference to a hash where the following keys are defined:
	upload has a value which is a string
MetadataValidate is a reference to a hash where the following keys are defined:
	message has a value which is a string
	is_valid has a value which is an int


=end text

=item Description

Metagenomic metadata is data providing information about one or more aspects of a set sequences from a sample of some environment
Validate given metadata spreadsheet

=back

=cut

sub post_metadata_validate
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function post_metadata_validate (received $n, expecting 1)");
    }
    {
	my($PostMetadataValidateParams) = @args;

	my @_bad_arguments;
        (ref($PostMetadataValidateParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"PostMetadataValidateParams\" (value was \"$PostMetadataValidateParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to post_metadata_validate:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'post_metadata_validate');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.post_metadata_validate",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'post_metadata_validate',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method post_metadata_validate",
					    status_line => $self->{client}->status_line,
					    method_name => 'post_metadata_validate',
				       );
    }
}



=head2 get_metadata_validate

  $return = $obj->get_metadata_validate($GetMetadataValidateParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetMetadataValidateParams is a CommunitiesAPI.GetMetadataValidateParams
$return is a CommunitiesAPI.MetadataValidate
GetMetadataValidateParams is a reference to a hash where the following keys are defined:
	group has a value which is a string
	value has a value which is a string
	category has a value which is a string
	label has a value which is a string
MetadataValidate is a reference to a hash where the following keys are defined:
	message has a value which is a string
	is_valid has a value which is an int

</pre>

=end html

=begin text

$GetMetadataValidateParams is a CommunitiesAPI.GetMetadataValidateParams
$return is a CommunitiesAPI.MetadataValidate
GetMetadataValidateParams is a reference to a hash where the following keys are defined:
	group has a value which is a string
	value has a value which is a string
	category has a value which is a string
	label has a value which is a string
MetadataValidate is a reference to a hash where the following keys are defined:
	message has a value which is a string
	is_valid has a value which is an int


=end text

=item Description

Metagenomic metadata is data providing information about one or more aspects of a set sequences from a sample of some environment
Validate given metadata value

=back

=cut

sub get_metadata_validate
{
    my($self, @args) = @_;

# Authentication: none

    if ((my $n = @args) != 1)
    {
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error =>
							       "Invalid argument count for function get_metadata_validate (received $n, expecting 1)");
    }
    {
	my($GetMetadataValidateParams) = @args;

	my @_bad_arguments;
        (ref($GetMetadataValidateParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetMetadataValidateParams\" (value was \"$GetMetadataValidateParams\")");
        if (@_bad_arguments) {
	    my $msg = "Invalid arguments passed to get_metadata_validate:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	    Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
								   method_name => 'get_metadata_validate');
	}
    }

    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesAPI.get_metadata_validate",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    Bio::KBase::Exceptions::JSONRPC->throw(error => $result->error_message,
					       code => $result->content->{code},
					       method_name => 'get_metadata_validate',
					      );
	} else {
	    return wantarray ? @{$result->result} : $result->result->[0];
	}
    } else {
        Bio::KBase::Exceptions::HTTP->throw(error => "Error invoking method get_metadata_validate",
					    status_line => $self->{client}->status_line,
					    method_name => 'get_metadata_validate',
				       );
    }
}



=head2 get_metagenome_query

  $return = $obj->get_metagenome_query($GetMetagenomeQueryParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetMetagenomeQueryParams is a CommunitiesAPI.GetMetagenomeQueryParams
$return is a CommunitiesAPI.MetagenomeQuery
GetMetagenomeQueryParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	function has a value which is a string
	status has a value which is a string
	match has a value which is a string
	direction has a value which is a string
	order has a value which is a string
	metadata has a value which is a string
	limit has a value which is an int
	organism has a value which is a string
	md5 has a value which is a string
	offset has a value which is an int
MetagenomeQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	order has a value which is a string
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int

</pre>

=end html

=begin text

$GetMetagenomeQueryParams is a CommunitiesAPI.GetMetagenomeQueryParams
$return is a CommunitiesAPI.MetagenomeQuery
GetMetagenomeQueryParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	function has a value which is a string
	status has a value which is a string
	match has a value which is a string
	direction has a value which is a string
	order has a value which is a string
	metadata has a value which is a string
	limit has a value which is an int
	organism has a value which is a string
	md5 has a value which is a string
	offset has a value which is an int
MetagenomeQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	version has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	total_count has a value which is an int
	order has a value which is a string
	url has a value which is a string
	limit has a value which is an int
	offset has a value which is an int


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
	my($GetMetagenomeQueryParams) = @args;

	my @_bad_arguments;
        (ref($GetMetagenomeQueryParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetMetagenomeQueryParams\" (value was \"$GetMetagenomeQueryParams\")");
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

  $return = $obj->get_metagenome_instance($GetMetagenomeInstanceParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetMetagenomeInstanceParams is a CommunitiesAPI.GetMetagenomeInstanceParams
$return is a CommunitiesAPI.MetagenomeInstance
GetMetagenomeInstanceParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
MetagenomeInstance is a reference to a hash where the following keys are defined:
	statistics has a value which is a reference to a hash where the key is a string and the value is a string
	status has a value which is a string
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
	mixs has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$GetMetagenomeInstanceParams is a CommunitiesAPI.GetMetagenomeInstanceParams
$return is a CommunitiesAPI.MetagenomeInstance
GetMetagenomeInstanceParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
MetagenomeInstance is a reference to a hash where the following keys are defined:
	statistics has a value which is a reference to a hash where the key is a string and the value is a string
	status has a value which is a string
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
	mixs has a value which is a reference to a hash where the key is a string and the value is a string


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
	my($GetMetagenomeInstanceParams) = @args;

	my @_bad_arguments;
        (ref($GetMetagenomeInstanceParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetMetagenomeInstanceParams\" (value was \"$GetMetagenomeInstanceParams\")");
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

  $return = $obj->get_project_query($GetProjectQueryParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetProjectQueryParams is a CommunitiesAPI.GetProjectQueryParams
$return is a CommunitiesAPI.ProjectQuery
GetProjectQueryParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
ProjectQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	offset has a value which is an int
	total_count has a value which is an int

</pre>

=end html

=begin text

$GetProjectQueryParams is a CommunitiesAPI.GetProjectQueryParams
$return is a CommunitiesAPI.ProjectQuery
GetProjectQueryParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
ProjectQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	offset has a value which is an int
	total_count has a value which is an int


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
	my($GetProjectQueryParams) = @args;

	my @_bad_arguments;
        (ref($GetProjectQueryParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetProjectQueryParams\" (value was \"$GetProjectQueryParams\")");
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

  $return = $obj->get_project_instance($GetProjectInstanceParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetProjectInstanceParams is a CommunitiesAPI.GetProjectInstanceParams
$return is a CommunitiesAPI.ProjectInstance
GetProjectInstanceParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
ProjectInstance is a reference to a hash where the following keys are defined:
	status has a value which is a string
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

$GetProjectInstanceParams is a CommunitiesAPI.GetProjectInstanceParams
$return is a CommunitiesAPI.ProjectInstance
GetProjectInstanceParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
ProjectInstance is a reference to a hash where the following keys are defined:
	status has a value which is a string
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
	my($GetProjectInstanceParams) = @args;

	my @_bad_arguments;
        (ref($GetProjectInstanceParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetProjectInstanceParams\" (value was \"$GetProjectInstanceParams\")");
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

  $return = $obj->get_sample_query($GetSampleQueryParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetSampleQueryParams is a CommunitiesAPI.GetSampleQueryParams
$return is a CommunitiesAPI.SampleQuery
GetSampleQueryParams is a reference to a hash where the following keys are defined:
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
SampleQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	offset has a value which is an int
	total_count has a value which is an int

</pre>

=end html

=begin text

$GetSampleQueryParams is a CommunitiesAPI.GetSampleQueryParams
$return is a CommunitiesAPI.SampleQuery
GetSampleQueryParams is a reference to a hash where the following keys are defined:
	order has a value which is a string
	limit has a value which is an int
	offset has a value which is an int
SampleQuery is a reference to a hash where the following keys are defined:
	next has a value which is a string
	prev has a value which is a string
	order has a value which is a string
	limit has a value which is an int
	data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
	offset has a value which is an int
	total_count has a value which is an int


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
	my($GetSampleQueryParams) = @args;

	my @_bad_arguments;
        (ref($GetSampleQueryParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetSampleQueryParams\" (value was \"$GetSampleQueryParams\")");
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

  $return = $obj->get_sample_instance($GetSampleInstanceParams)

=over 4

=item Parameter and return types

=begin html

<pre>
$GetSampleInstanceParams is a CommunitiesAPI.GetSampleInstanceParams
$return is a CommunitiesAPI.SampleInstance
GetSampleInstanceParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
SampleInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	created has a value which is a string
	env_package has a value which is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	id has a value which is a string
	metadata has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

$GetSampleInstanceParams is a CommunitiesAPI.GetSampleInstanceParams
$return is a CommunitiesAPI.SampleInstance
GetSampleInstanceParams is a reference to a hash where the following keys are defined:
	verbosity has a value which is a string
	id has a value which is a string
SampleInstance is a reference to a hash where the following keys are defined:
	version has a value which is an int
	project has a value which is a string
	name has a value which is a string
	created has a value which is a string
	env_package has a value which is a reference to a hash where the key is a string and the value is a string
	url has a value which is a string
	id has a value which is a string
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
	my($GetSampleInstanceParams) = @args;

	my @_bad_arguments;
        (ref($GetSampleInstanceParams) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument 1 \"GetSampleInstanceParams\" (value was \"$GetSampleInstanceParams\")");
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
                method_name => 'get_sample_instance',
            );
        } else {
            return wantarray ? @{$result->result} : $result->result->[0];
        }
    } else {
        Bio::KBase::Exceptions::HTTP->throw(
            error => "Error invoking method get_sample_instance",
            status_line => $self->{client}->status_line,
            method_name => 'get_sample_instance',
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



=head2 PostComputeNormalizeParams

=over 4



=item Description

row id


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is an int
rows has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is an int
rows has a value which is a reference to a list where each element is a string


=end text

=back



=head2 ComputeNormalize

=over 4



=item Description

row id


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a string


=end text

=back



=head2 PostComputeHeatmapParams

=over 4



=item Description

option to use raw data (not normalize)


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
cluster has a value which is a string
distance has a value which is a string
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is an int
rows has a value which is a reference to a list where each element is a string
raw has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
cluster has a value which is a string
distance has a value which is a string
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is an int
rows has a value which is a reference to a list where each element is a string
raw has a value which is an int


=end text

=back



=head2 ComputeHeatmap

=over 4



=item Description

row id


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
colindex has a value which is a reference to a list where each element is a float
coldend has a value which is a reference to a hash where the key is a string and the value is a string
rowindex has a value which is a reference to a list where each element is a float
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rowdend has a value which is a reference to a hash where the key is a string and the value is a string
rows has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
colindex has a value which is a reference to a list where each element is a float
coldend has a value which is a reference to a hash where the key is a string and the value is a string
rowindex has a value which is a reference to a list where each element is a float
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rowdend has a value which is a reference to a hash where the key is a string and the value is a string
rows has a value which is a reference to a list where each element is a string


=end text

=back



=head2 PostComputePcoaParams

=over 4



=item Description

option to use raw data (not normalize)


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
distance has a value which is a string
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is an int
rows has a value which is a reference to a list where each element is a string
raw has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
distance has a value which is a string
columns has a value which is a reference to a list where each element is a string
data has a value which is a reference to a list where each element is an int
rows has a value which is a reference to a list where each element is a string
raw has a value which is an int


=end text

=back



=head2 ComputePcoa

=over 4



=item Description

pcoa object


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
pco has a value which is a reference to a list where each element is a float
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
pco has a value which is a reference to a list where each element is a float
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 GetDownloadInstanceParams

=over 4



=item Description

unique metagenome identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
file has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
file has a value which is a string
id has a value which is a string


=end text

=back



=head2 DownloadInstance

=over 4



=item Description

requested analysis file


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



=head2 GetDownloadSetlistParams

=over 4



=item Description

unique metagenome identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
stage has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
stage has a value which is a string
id has a value which is a string


=end text

=back



=head2 DownloadSetlist

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
file_id has a value which is a string
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
file_id has a value which is a string
stage_type has a value which is a string
stage_id has a value which is a string


=end text

=back



=head2 GetInboxViewParams

=over 4



=item Description

unique string of text generated by MG-RAST for your account


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
auth has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
auth has a value which is a string


=end text

=back



=head2 InboxView

=over 4



=item Description

user login


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
timestamp has a value which is a string
files has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
timestamp has a value which is a string
files has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
id has a value which is a string


=end text

=back



=head2 PostInboxUploadParams

=over 4



=item Description

file to upload to inbox


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
auth has a value which is a string
upload has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
auth has a value which is a string
upload has a value which is a string


=end text

=back



=head2 InboxUpload

=over 4



=item Description

user login


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
timestamp has a value which is a string
status has a value which is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
timestamp has a value which is a string
status has a value which is a string
id has a value which is a string


=end text

=back



=head2 GetLibraryQueryParams

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
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
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
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 GetLibraryInstanceParams

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



=head2 LibraryInstance

=over 4



=item Description

key value pairs describing metadata


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



=head2 GetM5nrOntologyParams

=over 4



=item Description

This parameter value can be chosen from the following (the first being default):

        function - bottom ontology level
        level3 - ontology level
        level2 - ontology level
        level1 - top ontology level


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
parent_name has a value which is a string
id_map has a value which is an int
min_level has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
parent_name has a value which is a string
id_map has a value which is an int
min_level has a value which is a string


=end text

=back



=head2 M5nrOntology

=over 4



=item Description

requested ontology levels, from highest to lowest


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a list where each element is a string


=end text

=back



=head2 GetM5nrTaxonomyParams

=over 4



=item Description

This parameter value can be chosen from the following (the first being default):

        species - taxonomy level
        genus - taxonomy level
        family - taxonomy level
        order -  taxonomy level
        class -  taxonomy level
        phylum - taxonomy level
        domain - top taxonomy level


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
parent_name has a value which is a string
id_map has a value which is an int
min_level has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
parent_name has a value which is a string
id_map has a value which is an int
min_level has a value which is a string


=end text

=back



=head2 M5nrTaxonomy

=over 4



=item Description

requested taxonomy levels, from highest to lowest


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a list where each element is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a list where each element is a string


=end text

=back



=head2 M5nrSources

=over 4



=item Description

source object hash


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
version has a value which is an int
url has a value which is a string
data has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 GetM5nrAccessionParams

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
sequence has a value which is an int
order has a value which is a string
id has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
sequence has a value which is an int
order has a value which is a string
id has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrAccession

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 GetM5nrMd5Params

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
sequence has a value which is an int
order has a value which is a string
id has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
sequence has a value which is an int
order has a value which is a string
id has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrMd5

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 GetM5nrFunctionParams

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
text has a value which is a string
order has a value which is a string
exact has a value which is an int
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
text has a value which is a string
order has a value which is a string
exact has a value which is an int
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrFunction

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 GetM5nrOrganismParams

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
text has a value which is a string
order has a value which is a string
exact has a value which is an int
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
text has a value which is a string
order has a value which is a string
exact has a value which is an int
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrOrganism

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 GetM5nrSequenceParams

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
text has a value which is a string
order has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
text has a value which is a string
order has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrSequence

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 PostM5nrAccessionParams

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
order has a value which is a string
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
order has a value which is a string
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrAccession

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 PostM5nrMd5Params

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
order has a value which is a string
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
order has a value which is a string
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrMd5

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 PostM5nrFunctionParams

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
order has a value which is a string
exact has a value which is an int
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
order has a value which is a string
exact has a value which is an int
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrFunction

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 PostM5nrOrganismParams

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
order has a value which is a string
exact has a value which is an int
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
order has a value which is a string
exact has a value which is an int
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrOrganism

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 PostM5nrSequenceParams

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
order has a value which is a string
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
order has a value which is a string
data has a value which is a reference to a list where each element is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 M5nrSequence

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 GetMatrixOrganismParams

=over 4



=item Description

This parameter value can be chosen from the following (the first being default):

        function - bottom function ontology level
        level3 - function ontology level
        level2 - function ontology level
        level1 - top function ontology level


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
asynchronous has a value which is an int
result_type has a value which is a string
filter has a value which is a string
group_level has a value which is a string
taxid has a value which is an int
grep has a value which is a string
length has a value which is an int
identity has a value which is an int
evalue has a value which is an int
filter_source has a value which is a string
id has a value which is a string
hide_metadata has a value which is an int
hit_type has a value which is a string
filter_level has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
asynchronous has a value which is an int
result_type has a value which is a string
filter has a value which is a string
group_level has a value which is a string
taxid has a value which is an int
grep has a value which is a string
length has a value which is an int
identity has a value which is an int
evalue has a value which is an int
filter_source has a value which is a string
id has a value which is a string
hide_metadata has a value which is an int
hit_type has a value which is a string
filter_level has a value which is a string


=end text

=back



=head2 MatrixOrganism

=over 4



=item Description

type of the data in the return table (taxon, function or gene)


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
shape has a value which is a reference to a list where each element is an int
id has a value which is a string
type has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
shape has a value which is a reference to a list where each element is an int
id has a value which is a string
type has a value which is a string


=end text

=back



=head2 GetMatrixFunctionParams

=over 4



=item Description

This parameter value can be chosen from the following (the first being default):

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
asynchronous has a value which is an int
result_type has a value which is a string
filter has a value which is a string
group_level has a value which is a string
grep has a value which is a string
length has a value which is an int
identity has a value which is an int
evalue has a value which is an int
filter_source has a value which is a string
id has a value which is a string
hide_metadata has a value which is an int
filter_level has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
asynchronous has a value which is an int
result_type has a value which is a string
filter has a value which is a string
group_level has a value which is a string
grep has a value which is a string
length has a value which is an int
identity has a value which is an int
evalue has a value which is an int
filter_source has a value which is a string
id has a value which is a string
hide_metadata has a value which is an int
filter_level has a value which is a string


=end text

=back



=head2 MatrixFunction

=over 4



=item Description

type of the data in the return table (taxon, function or gene)


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
shape has a value which is a reference to a list where each element is an int
id has a value which is a string
type has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
shape has a value which is a reference to a list where each element is an int
id has a value which is a string
type has a value which is a string


=end text

=back



=head2 GetMatrixFeatureParams

=over 4



=item Description

if false return metagenome metadata set in 'columns' object


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
source has a value which is a string
asynchronous has a value which is an int
result_type has a value which is a string
grep has a value which is a string
length has a value which is an int
evalue has a value which is an int
identity has a value which is an int
id has a value which is a string
hide_metadata has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
source has a value which is a string
asynchronous has a value which is an int
result_type has a value which is a string
grep has a value which is a string
length has a value which is an int
evalue has a value which is an int
identity has a value which is an int
id has a value which is a string
hide_metadata has a value which is an int


=end text

=back



=head2 MatrixFeature

=over 4



=item Description

type of the data in the return table (taxon, function or gene)


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
shape has a value which is a reference to a list where each element is an int
id has a value which is a string
type has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
generated_by has a value which is a string
matrix_type has a value which is a string
date has a value which is a string
data has a value which is a reference to a list where each element is a reference to a list where each element is a float
rows has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
matrix_element_value has a value which is a string
matrix_element_type has a value which is a string
format_url has a value which is a string
format has a value which is a string
columns has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
shape has a value which is a reference to a list where each element is an int
id has a value which is a string
type has a value which is a string


=end text

=back



=head2 MetadataTemplate

=over 4



=item Description

samples and their metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
ep has a value which is a reference to a hash where the key is a string and the value is a string
project has a value which is a reference to a hash where the key is a string and the value is a string
library has a value which is a reference to a hash where the key is a string and the value is a string
sample has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
ep has a value which is a reference to a hash where the key is a string and the value is a string
project has a value which is a reference to a hash where the key is a string and the value is a string
library has a value which is a reference to a hash where the key is a string and the value is a string
sample has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 MetadataCv

=over 4



=item Description

list of CV terms for metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
ontology has a value which is a reference to a hash where the key is a string and the value is a string
ont_id has a value which is a reference to a hash where the key is a string and the value is a string
select has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
ontology has a value which is a reference to a hash where the key is a string and the value is a string
ont_id has a value which is a reference to a hash where the key is a string and the value is a string
select has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 GetMetadataExportParams

=over 4



=item Description

unique object identifier


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



=head2 MetadataExport

=over 4



=item Description

unique object identifier


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
sampleNum has a value which is an int
samples has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
name has a value which is a string
data has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
sampleNum has a value which is an int
samples has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
name has a value which is a string
data has a value which is a reference to a hash where the key is a string and the value is a string
id has a value which is a string


=end text

=back



=head2 PostMetadataValidateParams

=over 4



=item Description

xlsx or xls format spreadsheet with metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
upload has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
upload has a value which is a string


=end text

=back



=head2 MetadataValidate

=over 4



=item Description

the metadata sheet is valid


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
metadata has a value which is a reference to a hash where the key is a string and the value is a string
message has a value which is a string
is_valid has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
metadata has a value which is a reference to a hash where the key is a string and the value is a string
message has a value which is a string
is_valid has a value which is an int


=end text

=back



=head2 GetMetadataValidateParams

=over 4



=item Description

metadata label


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
group has a value which is a string
value has a value which is a string
category has a value which is a string
label has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
group has a value which is a string
value has a value which is a string
category has a value which is a string
label has a value which is a string


=end text

=back



=head2 MetadataValidate

=over 4



=item Description

the inputed value is valid for the given category and label


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
message has a value which is a string
is_valid has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
message has a value which is a string
is_valid has a value which is an int


=end text

=back



=head2 GetMetagenomeQueryParams

=over 4



=item Description

zero based index of the first data object to be returned


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
verbosity has a value which is a string
function has a value which is a string
status has a value which is a string
match has a value which is a string
direction has a value which is a string
order has a value which is a string
metadata has a value which is a string
limit has a value which is an int
organism has a value which is a string
md5 has a value which is a string
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
verbosity has a value which is a string
function has a value which is a string
status has a value which is a string
match has a value which is a string
direction has a value which is a string
order has a value which is a string
metadata has a value which is a string
limit has a value which is an int
organism has a value which is a string
md5 has a value which is a string
offset has a value which is an int


=end text

=back



=head2 MetagenomeQuery

=over 4



=item Description

zero based index of the first returned data item


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
order has a value which is a string
url has a value which is a string
limit has a value which is an int
offset has a value which is an int

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
next has a value which is a string
prev has a value which is a string
version has a value which is an int
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
total_count has a value which is an int
order has a value which is a string
url has a value which is a string
limit has a value which is an int
offset has a value which is an int


=end text

=back



=head2 GetMetagenomeInstanceParams

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



=head2 MetagenomeInstance

=over 4



=item Description

key value pairs describing MIxS metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
statistics has a value which is a reference to a hash where the key is a string and the value is a string
status has a value which is a string
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
mixs has a value which is a reference to a hash where the key is a string and the value is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
statistics has a value which is a reference to a hash where the key is a string and the value is a string
status has a value which is a string
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
mixs has a value which is a reference to a hash where the key is a string and the value is a string


=end text

=back



=head2 GetProjectQueryParams

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
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
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
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 GetProjectInstanceParams

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



=head2 ProjectInstance

=over 4



=item Description

the first and last name of the principal investigator of the project


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
status has a value which is a string
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
status has a value which is a string
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



=head2 GetSampleQueryParams

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
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
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
data has a value which is a reference to a list where each element is a reference to a hash where the key is a string and the value is a string
offset has a value which is an int
total_count has a value which is an int


=end text

=back



=head2 GetSampleInstanceParams

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



=head2 SampleInstance

=over 4



=item Description

key value pairs describing metadata


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
version has a value which is an int
project has a value which is a string
name has a value which is a string
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
created has a value which is a string
env_package has a value which is a reference to a hash where the key is a string and the value is a string
url has a value which is a string
id has a value which is a string
metadata has a value which is a reference to a hash where the key is a string and the value is a string


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
        # $obj->{id} = $self->id if (defined $self->id);
	# Assign a random number to the id if one hasn't been set
	$obj->{id} = (defined $self->id) ? $self->id : substr(rand(),2);
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
