use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'max';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $w = <STDIN>);
chomp(my $h = <STDIN>);
my @grid;
for my $i (0..$h-1) {
    chomp(my $row = <STDIN>);

    my @row_array = split '', $row;
    push @grid, \@row_array;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @horizontal_block_count;
foreach my $row (@grid) {
    push @horizontal_block_count, scalar(grep { $_ eq '#' } @{$row});
}
my @vertical_block_count;
foreach my $row (transpose(@grid)) {
    push @vertical_block_count, scalar(grep { $_ eq '#' } @{$row});
}

my $filled_horizontal_line_count = grep { $_ == $w } @horizontal_block_count;
my $filled_vertical_line_count = grep { $_ == $h } @vertical_block_count;
my $filled_count = $filled_horizontal_line_count + $filled_vertical_line_count;

my $result = 0;
foreach my $row_index (0..($h - 1)) {
    next if $row_index == $h - 1;

    foreach my $column_index (0..($w - 1)) {
        next if $column_index == $w - 1;

        next if grep { $_ ne '.' } (
            $grid[$row_index][$column_index],
            $grid[$row_index][$column_index + 1],
            $grid[$row_index + 1][$column_index],
            $grid[$row_index + 1][$column_index + 1]
        );

        my $new_filled_line_count = grep { $_ } (
            $horizontal_block_count[$row_index]      + 2 == $w,
            $horizontal_block_count[$row_index + 1]  + 2 == $w,
            $vertical_block_count[$column_index]     + 2 == $h,
            $vertical_block_count[$column_index + 1] + 2 == $h
        );

        $result = max($result, $filled_count + $new_filled_line_count);
    }
}

# print "answer\n";
print "$result";

sub transpose {
    my @dimension_array = @_;

    my @result;
    my @first_row = @{$dimension_array[0]};
    foreach my $column_index (0..$#first_row) {
        my @row;
        foreach my $row_index (0..$#dimension_array) {
            push @row, @{$dimension_array[$row_index]}[$column_index];
        }

        push @result, \@row;
    }

    return @result;
}

