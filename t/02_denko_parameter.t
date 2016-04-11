use strict;
use warnings;
use utf8;

use Test::More;
use Acme::NantokaMemories::Denko;

subtest 'パラメータを設定して, アクセスできる' => sub {
    my $denko = Acme::NantokaMemories::Denko->new(
        name => 'しいら',
        hp   => 84,
        atk  => 50,
    );

    is $denko->name, 'しいら';
    is $denko->hp,   84;
    is $denko->atk,  50;
};

done_testing;
