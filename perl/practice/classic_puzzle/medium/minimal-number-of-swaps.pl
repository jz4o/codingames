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
my @xs;
for my $x (@inputs) {
    push @xs, $x;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $xs_size = scalar(@xs);
my $l_index = -1;
my $r_index = $xs_size;
my $turn = 0;
while ($l_index < $r_index) {
    $l_index++;
    while ($l_index < $xs_size && $xs[$l_index] != 0) {
        $l_index++;
    }

    $r_index--;
    while ($r_index >= 0 && $xs[$r_index] != 1) {
        $r_index--;
    }

    $turn++;
}

# print "answer\n";
print $turn - 1;

