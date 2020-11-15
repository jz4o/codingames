use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>);
chomp($tokens=<STDIN>);
my @inputs = split(/ /,$tokens);
my @integers;
for my $x (@inputs) {
    push @integers, $x;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $total_cost = 0;
while (scalar(@integers) >= 2) {
    @integers = sort { $a <=> $b } @integers;

    my $first_integer = shift @integers;
    my $second_integer = shift @integers;

    my $cost = $first_integer + $second_integer;

    $total_cost += $cost;

    push @integers, $cost;
}

# print "0\n";
print $total_cost;

