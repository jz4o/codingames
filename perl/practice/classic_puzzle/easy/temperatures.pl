use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util qw( min max );

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>); # the number of temperatures to analyse
chomp($tokens=<STDIN>);
my @inputs = split(/ /,$tokens);
my @ts = [];
for my $t (@inputs) {
    push @ts, $t
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @negative_ts = grep { $_ < 0 } @ts;
my @positive_ts = grep { $_ > 0 } @ts;
my $closest_zero_negative;
my $closest_zero_positive;

if (grep { $_ == 0 } @ts) {
    $closest_zero_negative = 0;
    $closest_zero_positive = 0;
} else {
    if (@negative_ts) {
        $closest_zero_negative = max @negative_ts;
    }

    if (@positive_ts) {
        $closest_zero_positive = min @positive_ts;
    }
}

my $result;
if ($n == 0) {
    $result = 0;
} elsif (!@negative_ts) {
    $result = $closest_zero_positive;
} elsif (!@positive_ts) {
    $result = $closest_zero_negative;
} else {
    $result = $closest_zero_negative + $closest_zero_positive <= 0
        ? $closest_zero_positive : $closest_zero_negative;
}

# print "result\n";
print $result

