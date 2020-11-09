use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util qw(max);

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $cube_count = $n ** 3;

my $invisible_cube_width = max($n - 2, 0);
my $invisible_cube_count = $invisible_cube_width ** 3;

my $result = $cube_count - $invisible_cube_count;

# print "answer\n";
print "$result"

