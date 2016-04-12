use strict;
use warnings;
use Acme::NantokaMemories::Denko;
use Acme::NantokaMemories::Station;
use Data::Dumper;

my $shiira = Acme::NantokaMemories::Denko->new(
  name => 'しいら',
  hp => '84',
  atk => '50',
);

my $aaa = Acme::NantokaMemories::Denko->new(
  name => 'あああ',
  hp => '30',
  atk => '30',
);
#print Dumper $aaa;

my $st_test = Acme::NantokaMemories::Station->new (
  name => '新宿',
);

$st_test->access_by($shiira);
$st_test->access_by($aaa);
$st_test->access_by($aaa);
$st_test->access_by($aaa);
print Dumper $st_test;
