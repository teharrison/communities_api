package CommunitiesServerAPIClient;

use JSON::RPC::Client;
use strict;
use Data::Dumper;
use URI;

=head1 NAME

CommunitiesServerAPIClient

=head1 DESCRIPTION

This module provides an interface to communities study data.

=cut

sub new
{
    my($class, $url) = @_;

    my $self = {
	client => JSON::RPC::Client->new,
	url => $url,
    };
    return bless $self, $class;
}



=head2 $result = get_samply_by_id(sample_id)

This function gets a communities sample for the given sample id.

=cut

sub get_samply_by_id
{
    my($self, @args) = @_;

    @args == 1 or die "Invalid argument count (expecting 1)";
    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesServerAPI.get_samply_by_id",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    die "Error invoking get_samply_by_id: " . $result->error_message;
	} else {
	    return $result->result;
	}
    } else {
	die "Error invoking get_samply_by_id: " . $self->{client}->status_line;
    }
}




=head2 $result = get_library_by_id(lib_id)

This function gets a communities library for a given library id.

=cut

sub get_library_by_id
{
    my($self, @args) = @_;

    @args == 1 or die "Invalid argument count (expecting 1)";
    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesServerAPI.get_library_by_id",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    die "Error invoking get_library_by_id: " . $result->error_message;
	} else {
	    return $result->result;
	}
    } else {
	die "Error invoking get_library_by_id: " . $self->{client}->status_line;
    }
}




=head2 $result = get_metagenome_by_id(metagenome_id)

This function gets a communities metagenome for a given metagenome id.

=cut

sub get_metagenome_by_id
{
    my($self, @args) = @_;

    @args == 1 or die "Invalid argument count (expecting 1)";
    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesServerAPI.get_metagenome_by_id",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    die "Error invoking get_metagenome_by_id: " . $result->error_message;
	} else {
	    return $result->result;
	}
    } else {
	die "Error invoking get_metagenome_by_id: " . $self->{client}->status_line;
    }
}




=head2 $result = get_project_by_id(project_id)

This function gets a communities project given a project id.

=cut

sub get_project_by_id
{
    my($self, @args) = @_;

    @args == 1 or die "Invalid argument count (expecting 1)";
    my $result = $self->{client}->call($self->{url}, {
	method => "CommunitiesServerAPI.get_project_by_id",
	params => \@args,
    });
    if ($result) {
	if ($result->is_error) {
	    die "Error invoking get_project_by_id: " . $result->error_message;
	} else {
	    return $result->result;
	}
    } else {
	die "Error invoking get_project_by_id: " . $self->{client}->status_line;
    }
}




1;
