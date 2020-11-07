use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $r_1 = <STDIN>);
chomp(my $r_2 = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

while ($r_1 != $r_2) {
    if ($r_1 < $r_2) {
        foreach my $i (split //, $r_1) {
            $r_1 += $i;
        }
    } else {
        foreach my $i (split //, $r_2) {
            $r_2 += $i;
        }
    }
}

# print "42\n";
print $r_1;

