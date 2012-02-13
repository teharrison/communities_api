package Communities::Library ;

sub new{
  my ($class , $data) = @_ ;
  
  my $library = {
		 'id'           => '', # unique_identifier string,
		 'about'        => '', # about string,
		 'version'      => '', # version_information int,
		 'created'      => '', # creation_date date,
		 'url'          => '', # object_url string,
		 'sample'       => '', # sample_id string
		 'metagenome'   => '', # metagenome_id string,
		 'reads'        => '', # reads_id string , raw reads 
		 'sequece_sets' => [], # list of sequenceSet_id array of string,
		 'metadata'     => {}, # list of metadata hash of key value pairs		
		};
  
  map { $library->{ $_ } = $data->{$_} } keys %$data if (ref $data) ;
  
  return bless $library ;
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

sub sample { # sample_id  string 
  my ($self, $id) = @_ ;
  $self->{sample} = $id if ($id);
  return $self->{sample} 
}

sub reads { # reads_id  string 
  my ($self, $id) = @_ ;
  $self->{reads} = $id if ($id);
  return $self->{reads} 
}

sub  sequece_sets { # list of sequenceSet_id array of string,
 my ($self, $set_ids) = @_ ;
  $self->{sequence_sets} = $set_ids if ($set_ids and ref $set_ids);
 return $self->{sequence_sets} 
}


sub metadata { # list of metadata hash of key value pairs 
  my ($self, $md) = @_ ;
  $self->{metadata} = $md if ($md and ref $md) ;
  return $self->{metadata} 
}


1;
