use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'sum';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $r_1 = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $result = (grep { $_ + sum(split //, $_) == $r_1 } reverse(1..$r_1 - 1)) ? 'YES' : 'NO';

# print "YES|NO\n";
print "$result";

