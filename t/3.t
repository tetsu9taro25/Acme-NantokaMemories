use strict;
use warnings;
use utf8;

use Test::More;
use Acme::NantokaMemories::Station;

subtest '駅オブジェクトを生成できる' => sub {
    my $station = Acme::NantokaMemories::Station->new(
        name => '五反田',
    );

    isa_ok $station, 'Acme::NantokaMemories::Station';

    subtest 'パラメータを設定して, アクセスできる' => sub {
        is $station->name,     '五反田';
        is $station->linked_by, undef;
    };
};

done_testing;
