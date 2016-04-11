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

subtest 'でんこの体力が回復する' => sub {
    $shiira->{hp} -= 10;
    is $shiira->hp, 74;

    $shiira->recovery_hp(5);
    is $shiira->hp, 79;

    $shiira->recovery_hp(10);
    is $shiira->hp, 84;
};

done_testing;
