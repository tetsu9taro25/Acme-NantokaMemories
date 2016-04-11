use strict;
use warnings;
use utf8;

use Test::More;
use Acme::NantokaMemories::Denko;

subtest 'でんこオブジェクトを生成できる' => sub {
    my $denko = Acme::NantokaMemories::Denko->new();

    isa_ok $denko, 'Acme::NantokaMemories::Denko';
};

done_testing;
