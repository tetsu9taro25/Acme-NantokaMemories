use strict;
use warnings;
use utf8;

use Test::More;
use Acme::NantokaMemories::Denko;

my $denko = Acme::NantokaMemories::Denko->new();
isa_ok $denko, 'Acme::NantokaMemories::Denko', 'でんこのオブジェクトを生成できる';

done_testing;
