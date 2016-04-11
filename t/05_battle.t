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

$station->access_by($shiira);

subtest 'でんこが駅にアクセスした際, バトルが起きる' => sub {
    subtest 'ルナ: アクセス1回目' => sub {
        $station->access_by($luna);
        is $station->linked_by, $shiira, 'しいらが駅とリンクしている';
        is $shiira->hp, 54, 'しいらの体力が減っている';
    };

    subtest 'ルナ: アクセス2回目' => sub {
        $station->access_by($luna);
        is $station->linked_by, $shiira, 'しいらが駅とリンクしている';
        is $shiira->hp, 24, 'しいらの体力が減っている';
    };

    subtest 'ルナ: アクセス3回目' => sub {
        $station->access_by($luna);
        is $station->linked_by, $luna, 'ルナが駅とリンクしている';
        is $shiira->hp, 84, 'しいらの体力が回復している';
    };
};

done_testing;
