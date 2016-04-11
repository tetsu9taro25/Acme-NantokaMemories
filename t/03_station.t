use strict;
use warnings;
use utf8;

use Test::More;
use Acme::NantokaMemories::Station;

my $station = Acme::NantokaMemories::Station->new(
    name => '五反田',
);

isa_ok $station, 'Acme::NantokaMemories::Station', '駅のオブジェクを生成できる';

subtest 'パラメータを設定して, アクセスできる' => sub {
    is $station->name,     '五反田';
    is $station->linked_by, undef;
};

done_testing;
