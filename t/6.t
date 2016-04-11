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

subtest 'リンク済みのでんこが駅にアクセスした場合, バトルが起きない' => sub {
    subtest 'しいら: アクセス1回目' => sub {
        $station->access_by($shiira);
        is $station->linked_by, $shiira;
    };

    subtest 'しいら: アクセス2回目' => sub {
        $station->access_by($shiira);
        is $station->linked_by, $shiira;

        subtest 'しいらのHPが減っていない' => sub {
            is $shiira->hp, 84;
        };
    };
};

done_testing;
