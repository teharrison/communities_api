package Communities::Project ;

sub new {
  my ($class , $data) = @_;

# {
# 'id': unique_identifier string,
# 'about': about string,
# 'version': version_information int,
# 'created': creation_date date,
# 'url': object_url string,
# 'type': project_type string [project|study],
# 'name': project_name string,
# 'public': public boolean [0|1],
# 'analyzed': list of metagenome_id array of string,
# 'pi': last_and_firstname_of_PI string,
# 'description': project_description string,
# 'funding_source': funding_source string,
# 'metadata': list of metadata hash of key value pairs,
# 'samples': list of sample_id array of string
# }

  return bless $data ;
}


# unique_identifier string
sub id {
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}

# about string
sub about {
  my ($self, $about) = @_ ;
  $self->{about} = $id if ($about);
  return $self->{about} 
}

# version_information int,
sub version {
 my ($self, $version) = @_ ;
  $self->{version} = $version if ($version);
  return $self->{version} 
} 

 # creation_date date,
sub created_on {
 my ($self, $created) = @_ ;
  $self->{created} = $created if ($created);
  return $self->{created} 
}

 # object_url string,
sub url {  
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}

# project_type string [project|study],
sub type {  
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}

# project_name string,
sub name {  
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}

# public boolean [0|1],
sub public {  
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}

# list of metagenome_id array of string,
sub analyzed {  
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id}
}

# last_and_firstname_of_PI string,
sub pi {
 my ($self, $id) = @_ ;
 $self->{id} = $id if ($id);
 return $self->{id} 
}

# project_description string,
sub description {  
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}

# funding_source string,
sub funding_source { 
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}

# list of metadata hash of key value pairs
sub metadata {  
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}

# list of sample_id array of string
sub samples {  
  my ($self, $id) = @_ ;
  $self->{id} = $id if ($id);
  return $self->{id} 
}


1;
