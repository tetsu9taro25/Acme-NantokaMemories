package Acme::NantokaMemories::Station;
use strict;
use warnings;

sub new {
  my ($class, %params) = @_;
  $params{linked_by} = undef unless defined $params{linked_by};
  return bless {
    name => $params{name},
    linked_by => $params{linked_by},
    access_by => $params{access_by},
}, $class;
}

sub name {
  my ($self) = @_;
  return $self->{name};
}

sub linked_by {
  my ($self) = @_;
  return $self->{linked_by};
}

sub access_by {
  my ($self, $denko) = @_;

  if(!$self->{linked_by}){
    $self->{linked_by} = $denko;
  }elsif($self->{linked_by}->{name}==$denko->{name}){
    return;
  }elsif($self->{linked_by}->{hp} - $denko->{atk}<0){
    $self->{linked_by}->{hp} = $self->{linked_by}->{def_hp};
    $self->{linked_by} = $denko;
  }else{
    $self->{linked_by}->{hp}= $self->{linked_by}->{hp} -  $denko->{atk};
  }
  return;
}

1;
