use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'sum';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($n, $k) = split(/ /,$tokens);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @results;
my @temps;
foreach my $i (1..$k) {
    my @temp = ($i);
    push @temps, \@temp;
}

while (scalar @temps > 0) {
    my @temp = @{pop @temps};

    my $sum = sum @temp;

    if ($sum == $n) {
        unshift @results, \@temp;
    } elsif ($sum < $n) {
        foreach my $i (1..$k) {
            my @t = @temp;
            push @t, $i;
            push @temps, \@t;
        }
    }
}

# print "answer\n";
foreach my $scalar_result (@results) {
    my $result = join ' ', @{$scalar_result};

    print "$result\n";
}

