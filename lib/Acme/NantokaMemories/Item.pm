package Acme::NantokaMemories::Item;
use strict;
use warnings;
use Data::Dumper;

sub new {
  my ($class, %params) = @_;
#  return bless \%params, $class;
  return bless {
    name => $params{ name },
    effect => $params{ effect },
  }, $class;
}


sub name {
  my ($self) = @_;
  return $self->{name};
}

1;
