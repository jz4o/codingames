use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util qw( min sum );
use POSIX 'floor';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
chomp(my $c = <STDIN>);
my @budgets;
for my $i (0..$n-1) {
    chomp(my $b = <STDIN>);

    push @budgets, $b;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

if (sum (@budgets) < $c) {
    print 'IMPOSSIBLE';
} else {
    my $lack = $c;
    @budgets = sort { $a <=> $b } @budgets;
    while (@budgets) {
        my $average = floor($lack / scalar(@budgets));
        my $pay = min((shift @budgets), $average);
        $lack -= $pay;

        print "$pay\n";
    }
}

# print "IMPOSSIBLE\n";

