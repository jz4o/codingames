use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @pis;
for my $i (0..$n-1) {
    chomp(my $pi = <STDIN>);

    push @pis, $pi;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

@pis = sort { $a <=> $b } @pis;

my $min_diff = 10000000;
for (my $i = 0; $i < scalar(@pis) - 1; $i++) {
    my $diff = $pis[$i + 1] - $pis[$i];
    if ($diff < $min_diff) {
        $min_diff = $diff;
    }
}

# print "answer\n";
print "$min_diff\n";

