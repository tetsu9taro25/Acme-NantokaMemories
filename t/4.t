use strict;
use warnings;
use utf8;

use Test::More;
use Acme::NantokaMemories::Denko;
use Acme::NantokaMemories::Station;

my $station = Acme::NantokaMemories::Station->new(
    name => '五反田',
);

my $shiira = Acme::NantokaMemories::Denko->new(
    name => 'しいら',
    hp   => 84,
    atk  => 50,
);

my $luna = Acme::NantokaMemories::Denko->new(
    name => 'ルナ',
    hp   => 120,
    atk  => 30,
);

subtest 'でんこが駅にアクセスできる' => sub {
    $station->access_by($shiira);

    is $station->linked_by, $shiira;
};

done_testing;
