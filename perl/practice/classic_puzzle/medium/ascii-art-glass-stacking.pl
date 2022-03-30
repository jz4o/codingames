use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use POSIX 'floor';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $stage = 0;
my $glass_count = 0;
while ($glass_count + $stage + 1 <= $n) {
    $stage++;
    $glass_count += $stage;
}

my @GLASS_PARTS = (
    ' *** ',
    ' * * ',
    ' * * ',
    '*****'
);

my $WIDTH = $stage * length($GLASS_PARTS[0]) + $stage - 1;

my @results;
foreach my $step (1..$stage) {
    foreach my $glass_part (@GLASS_PARTS) {
        my $result = join(' ', ($glass_part) x $step);
        my $left_space = ' ' x floor(($WIDTH - length($result)) / 2);
        my $right_space = ' ' x ($WIDTH - length($result) - length($left_space));

        push @results, "$left_space$result$right_space";
    }
}

# print "answer\n";
foreach my $result (@results) {
    print "$result\n";
}

