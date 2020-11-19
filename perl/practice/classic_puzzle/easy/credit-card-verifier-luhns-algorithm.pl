use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @cards;
for my $i (0..$n-1) {
    chomp(my $card = <STDIN>);

    push @cards, $card;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

foreach my $card (@cards) {
    print is_valid_card($card) ? 'YES' : 'NO', "\n";
}

sub is_valid_card {
    my ($card) = @_;

    $card =~ s/ //g;

    my $sum = 0;
    for (my $i = 0; $i < length($card); $i++) {
        my $number = substr($card, $i, 1);

        if ($i % 2 == 0) {
            $number *= 2;
            if ($number >= 10) {
                $number -= 9;
            }
        }

        $sum += $number;
    }

    return $sum % 10 == 0;
}

