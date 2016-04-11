use strict;
use warnings;
use utf8;

use Test::More;
use Acme::NantokaMemories::Denko;
use Acme::NantokaMemories::Item;

my $shiira = Acme::NantokaMemories::Denko->new(
    name => 'しいら',
    hp   => 84,
    atk  => 50,
);

my $battery_50 = Acme::NantokaMemories::Item->new(
    name   => 'バッテリー50',
    effect => sub {
        my ($denko) = @_;
        $denko->recovery_hp(50);
    },
);

my $battery_150 = Acme::NantokaMemories::Item->new(
    name   => 'バッテリー150',
    effect => sub {
        my ($denko) = @_;
        $denko->recovery_hp(150);
    },
);

subtest 'でんこにアイテムを持っていない場合' => sub {
    is $shiira->item, undef;
};

subtest 'でんこにアイテムをもたせられる' => sub {
    $shiira->give_item($battery_50);
    is $shiira->item, $battery_50;
};

subtest 'でんこにアイテムをもたせられる(上書き)' => sub {
    $shiira->give_item($battery_150);
    is $shiira->item, $battery_150;
};

subtest 'でんこがアイテムを利用できる' => sub {
    $shiira->{hp} -= 10;
    is $shiira->{hp}, 74;

    $shiira->use_item();
    is $shiira->{hp}, 84;
    is $shiira->item, undef;
};

done_testing;
