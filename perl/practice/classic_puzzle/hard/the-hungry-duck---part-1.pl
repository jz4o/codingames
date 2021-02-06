use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'max';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($w, $h) = split(/ /,$tokens);
my @grid;
for my $i (0..$h-1) {
    chomp($tokens=<STDIN>);
    my @inputs = split(/ /,$tokens);
    for my $food (@inputs) {

    }
    push @grid, \@inputs;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

foreach my $height (0..($h - 1)) {
    foreach my $width (0..($w - 1)) {
        my $top = $height == 0 ? 0 : $grid[$height - 1][$width];
        my $left = $width == 0 ? 0 : $grid[$height][$width - 1];

        $grid[$height][$width] += max $top, $left;
    }
}

# print "answer\n";
print "$grid[$h - 1][$w - 1]";

