use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $sum = 0;
foreach my $i (1..$n) {
    $sum += int($n / $i) * $i;
}

# print "sum\n";
print "$sum";

