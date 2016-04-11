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
    subtest 'しいら: アクセス1回目' => sub {
        $station->access_by($shiira);
        is $station->linked_by, $shiira;
    };

    subtest 'ルナ: アクセス1回目' => sub {
        $station->access_by($luna);
        is $station->linked_by, $shiira;

        subtest 'しいらの体力が減っている' => sub {
            is $shiira->hp, 54;
        };
    };

    subtest 'ルナ: アクセス2回目' => sub {
        $station->access_by($luna);
        is $station->linked_by, $shiira;

        subtest 'しいらの体力が減っている' => sub {
            is $shiira->hp, 24;
        };
    };

    subtest 'ルナ: アクセス3回目' => sub {
        $station->access_by($luna);
        is $station->linked_by, $luna;

        subtest 'しいらの体力が回復している' => sub {
            is $shiira->hp, 84;
        };
    };
};

done_testing;
