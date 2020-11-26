use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use POSIX 'floor';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
chomp(my $b = <STDIN>);

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $longest_space_count          = 0;
my $left_index_in_longest_space  = 0;
my $right_index_in_longest_space = 0;
my $space_count                  = 0;
my $left_index_in_space          = 0;
my $right_index_in_space         = 0;
my @b_statuses = split //, "$b!";
while (my ($index, $b_status) = each @b_statuses) {
    if ($b_status eq 'U') {
        if ($space_count == 0) {
            $left_index_in_space = $index;
        }

        $space_count++;
        $right_index_in_space = $index;
    } else {
        if ($space_count > $longest_space_count) {
            $longest_space_count = $space_count;
            $left_index_in_longest_space = $left_index_in_space;
            $right_index_in_longest_space = $right_index_in_space;
        }

        $space_count = 0;
        $left_index_in_space = 0;
        $right_index_in_space = 0;
    }
}

my $result;
if ($left_index_in_longest_space == 0) {
    $result = $left_index_in_longest_space;
} elsif ($right_index_in_longest_space == $n - 1) {
    $result = $right_index_in_longest_space;
} else {
    $result = $left_index_in_longest_space + floor($longest_space_count / 2)
}

# print "0\n";
print "$result";

