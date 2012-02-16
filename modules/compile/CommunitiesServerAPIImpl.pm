package CommunitiesServerAPIImpl;
use strict;

=head1 NAME

CommunitiesServerAPI

=head1 DESCRIPTION

This module provides an interface to communities study data.

=cut

#BEGIN_HEADER
#END_HEADER

sub new
{
    my($class) = @_;
    my $self = {
    };
    #BEGIN_CONSTRUCTOR
    #END_CONSTRUCTOR

    bless $self, $class;
    if ($self->can('_init_instance'))
    {
	$self->_init_instance();
    }
    return $self;
}

=head1 METHODS



=head2 get_samply_by_id

  $return = $obj->get_samply_by_id($sample_id)

=over 4

=item Parameter and return types

=begin html

<pre>
$sample_id is a ComSampleID
$return is a reference to a hash where the key is a string and the value is a string
ComSampleID is a string

</pre>

=end html

=begin text

$sample_id is a ComSampleID
$return is a reference to a hash where the key is a string and the value is a string
ComSampleID is a string


=end text



=item Description

This function gets a communities sample for the given sample id.

=back

=cut

sub get_samply_by_id
{
    my($self, $ctx, $sample_id) = @_;
    
    my($return);
    
    #BEGIN get_samply_by_id
    #END get_samply_by_id
    
    return($return);
    
}




=head2 get_library_by_id

  $return = $obj->get_library_by_id($lib_id)

=over 4

=item Parameter and return types

=begin html

<pre>
$lib_id is a ComLibraryID
$return is a reference to a hash where the key is a string and the value is a string
ComLibraryID is a string

</pre>

=end html

=begin text

$lib_id is a ComLibraryID
$return is a reference to a hash where the key is a string and the value is a string
ComLibraryID is a string


=end text



=item Description

This function gets a communities library for a given library id.

=back

=cut

sub get_library_by_id
{
    my($self, $ctx, $lib_id) = @_;
    
    my($return);
    
    #BEGIN get_library_by_id
    #END get_library_by_id
    
    return($return);
    
}




=head2 get_metagenome_by_id

  $return = $obj->get_metagenome_by_id($metagenome_id)

=over 4

=item Parameter and return types

=begin html

<pre>
$metagenome_id is a ComMetagenomeID
$return is a reference to a hash where the key is a string and the value is a string
ComMetagenomeID is a string

</pre>

=end html

=begin text

$metagenome_id is a ComMetagenomeID
$return is a reference to a hash where the key is a string and the value is a string
ComMetagenomeID is a string


=end text



=item Description

This function gets a communities metagenome for a given metagenome id.

=back

=cut

sub get_metagenome_by_id
{
    my($self, $ctx, $metagenome_id) = @_;
    
    my($return);
    
    #BEGIN get_metagenome_by_id
    #END get_metagenome_by_id
    
    return($return);
    
}




=head1 TYPES



=head2 ComSampleID

=over 4



=item Description

This is a sample id for a communities study.


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 ComLibraryID

=over 4



=item Description

This is a library id for a communities study.


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 ComMetagenomeID

=over 4



=item Description

This is an id of a communities metagenome.


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=cut

1;
