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
my @vs;
for my $v (@inputs) {
    push @vs, $v;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $max_diff = 0;
my $min_value;
for my $v (reverse(@vs)) {
    if (!(defined $min_value) || $v < $min_value) {
        $min_value = $v;
    }

    my $diff = $min_value - $v;
    if ($diff < $max_diff) {
        $max_diff = $diff;
    }
}

# print "answer\n";
print $max_diff;

