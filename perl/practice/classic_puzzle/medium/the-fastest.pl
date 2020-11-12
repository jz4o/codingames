use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @ts;
for my $i (0..$n-1) {
    chomp(my $t = <STDIN>);

    push @ts, $t;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $fastest = (sort @ts)[0];

# print "answer\n";
print $fastest;

