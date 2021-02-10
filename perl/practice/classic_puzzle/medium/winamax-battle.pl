use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>); # the number of cards for player 1
my @deck1;
for my $i (0..$n-1) {
    chomp(my $cardp_1 = <STDIN>); # the n cards of player 1

    push @deck1, substr($cardp_1, 0, -1);
}
chomp(my $m = <STDIN>); # the number of cards for player 2
my @deck2;
for my $i (0..$m-1) {
    chomp(my $cardp_2 = <STDIN>); # the m cards of player 2

    push @deck2, substr($cardp_2, 0, -1);
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $result;
eval {
    my $turn = 0;
    while (scalar(@deck1) > 0 && scalar(@deck2) > 0) {
        $turn++;

        my %fight_result = fight(\@deck1, \@deck2, 0);

        my $move_size = $fight_result{'index'} + 1;
        if ($fight_result{'winner'} eq 1) {
            push @deck1, (splice(@deck1, 0, $move_size), splice(@deck2, 0, $move_size));
        } else {
            push @deck2, (splice(@deck1, 0, $move_size), splice(@deck2, 0, $move_size));
        }
    }

    my $winner = scalar(@deck1) < scalar(@deck2) ? 2 : 1;
    $result = "$winner $turn\n";
};
$result = 'PAT' if $@;

# print "PAT\n";
print "$result";

sub fight {
    my ($ref_deck1, $ref_deck2, $index) = @_;
    my @deck1 = @{$ref_deck1};
    my @deck2 = @{$ref_deck2};

    my @CARD_LANKS = ('2'..'10', 'J', 'Q', 'K', 'A');

    die if ($#deck1 < $index || $#deck2 < $index);

    my ($card1) = grep { $CARD_LANKS[$_] eq $deck1[$index] } 0..$#CARD_LANKS;
    my ($card2) = grep { $CARD_LANKS[$_] eq $deck2[$index] } 0..$#CARD_LANKS;

    return fight(\@deck1, \@deck2, $index + 4) if $card1 eq $card2;

    return (
        'winner' => $card1 < $card2 ? '2' : '1',
        'index' => $index
    );
}

