package Acme::NantokaMemories::Denko;
use strict;
use warnings;

sub new {
  my ($class, %params) = @_;
  return bless {
    name => $params{name},
    hp => $params{hp},
    atk => $params{atk},
    def_hp => $params{hp},
  }, $class;
}

sub name {
  my ($self) = @_;
  return $self->{name};
}

sub hp {
  my ($self) = @_;
  return $self->{hp};
}

sub atk {
  my ($self) = @_;
  return $self->{atk};
}

sub recovery_hp {
  my ($self, $point) = @_;
  my $temp_hp = $self->{hp} + $point;
  if($temp_hp > $self->{def_hp} ){
    $self->{hp} = $self->{def_hp};
  }else{
    $self->{hp} = $temp_hp;
  }
}

sub give_item {
  my ($self, $item) = @_;
  $self->{give_item} = $item;
}

sub use_item {
  my ($self) = @_;
  $self->{give_item}->{effect}->($self);
  $self->{give_item} = undef;
}

sub item {
  my ($self) = @_;
  return $self->{give_item};
}

1;
