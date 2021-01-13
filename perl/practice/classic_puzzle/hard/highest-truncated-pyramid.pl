use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);

my $part_count = 1;
my $top_step_count = 1;
my $bottom_step_count = 1;

while (1) {
    if ($part_count < $n) {
        $bottom_step_count++;
        $part_count += $bottom_step_count;
    } elsif ($n < $part_count) {
        $part_count -= $top_step_count;
        $top_step_count++;
    } else {
        last;
    }
}

foreach my $i ($top_step_count..$bottom_step_count) {
    print '*' x $i . "\n";
}

