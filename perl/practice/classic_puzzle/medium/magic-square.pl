use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'sum';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $n = <STDIN>);
my @grid;
for my $i (0..$n-1) {
    chomp($tokens=<STDIN>);
    my @inputs = split(/ /,$tokens);
    for my $c (@inputs) {

    }
    push @grid, \@inputs;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $all_sum = 0;
foreach my $row (@grid) {
    $all_sum += sum @{$row};
}

my $max_int_in_grid = $n ** 2;
my $expect_sum = sum 1..$max_int_in_grid;
my $is_check_all_sum = $all_sum == $expect_sum;
my $is_check_sums = is_equals_sums(@grid);

# print "answer\n";
print $is_check_all_sum && $is_check_sums ? 'MAGIC' : 'MUGGLE';


sub is_equals_sums {
    my @array = @_;

    my $result = 1;
    my $size = scalar @array;

    # counter
    my @line_sums = split '', '0' x $size;
    my @column_sums = split '', '0' x $size;
    my $left_top_to_right_bottom_sum = 0;
    my $left_bottom_to_right_top_sum = 0;

    # count
    foreach my $h (0..($size - 1)) {
        foreach my $w (0..($size - 1)) {
            my $value = $array[$h][$w];

            $line_sums[$h] += $value;
            $column_sums[$w] += $value;
            $left_top_to_right_bottom_sum += $value if $h == $w;
            $left_bottom_to_right_top_sum += $value if ($h + $w + 1) == $size;
        }
    }

    # check
    $result = $left_top_to_right_bottom_sum == $left_bottom_to_right_top_sum;
    foreach my $i (0..($size - 1)) {
        $result &= $left_top_to_right_bottom_sum == $line_sums[$i];
        $result &= $left_top_to_right_bottom_sum == $column_sums[$i];
    }

    return $result;
}

