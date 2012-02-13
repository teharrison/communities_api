package Communities::Sample ;

sub new{
    my ($class , $data) = @_ ;

    my $sample = {
	'id'         => '', # unique_identifier string,
	'about'      => '', # about string,
	'version'    => '', # version_information int,
	'created'    => '', # creation_date date,
	'url'        => '', # object_url string,
	'metagenome' => '', # metagenome_id string,
	'libraries'  => [], # list of library_id array of string,
	'metadata'   => {}, # list of metadata hash of key value pairs		
    };

    map { $sample->{ $_ } = $data->{$_} } keys %$data if (ref $data) ;

return bless $sample ;
}





sub id { # unique_identifier string 
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}


sub about { # about string 
  my ($self, $about) = @_ ;
  $self->{about} = $about if ($about);
  return $self->{about} 
}

sub version { # version_information int 
  my ($self, $version) = @_ ;
  $self->{version} = $version if ($version);
  return $self->{version} 
}

sub created_on { # creation_date date 
  my ($self, $created) = @_ ;
  $self->{created} = $created if ($created);
  return $self->{created} 
}

sub url { # object_url string 
  my ($self, $url) = @_ ;
  $self->{url} = $url if ($url);
  return $self->{url} 
}

sub metagenome { # metagenome_id string 
  my ($self, $id) = @_ ;
  $self->{metagenome} = $id if ($id);
  return $self->{metagenome} 
}

sub libraries { # list of library_id array of string 
  my ($self, $ids) = @_ ;
  $self->{libraries} = $ids if ($id);
  return $self->{libraries} 
}

sub metadata { # list of metadata hash of key value pairs 
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}



1;
