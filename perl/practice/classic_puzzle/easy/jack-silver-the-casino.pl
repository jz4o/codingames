use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use POSIX 'ceil';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $rounds = <STDIN>);
chomp(my $cash = <STDIN>);
for my $i (0..$rounds-1) {
    chomp(my $play = <STDIN>);

    my ($ball, $call, $number) = split / /, $play;

    my $bet = ceil $cash / 4;
    $cash -= $bet;

    if ($call eq 'PLAIN' && $ball == $number) {
        $cash += $bet * 36;
    } elsif ($call eq 'ODD' && $ball % 2 == 1) {
        $cash += $bet * 2;
    } elsif ($call eq 'EVEN' && $ball % 2 == 0 && $ball > 0) {
        $cash += $bet * 2;
    }
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

# print "cash of the target after playing\n";
print $cash;

