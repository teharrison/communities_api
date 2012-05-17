use Dancer;
set serializer => 'JSON';
 
get '/user/:id/' => sub {
    { foo => 42,
      number => 100234,
      list => [qw(one two three)],
    }
};
