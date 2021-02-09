use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($width, $height) = split(/ /,$tokens);
chomp(my $count = <STDIN>);
my @grid;
for my $i (0..$height-1) {
    chomp(my $raster = <STDIN>);

    my @row = split '', $raster;
    push @grid, \@row;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

foreach my $i (0..($count - 1)) {
    while (my ($index, $row) = each @grid) {
        my @sorted_row = sort @{$row};

        $grid[$index] = \@sorted_row;
    }
    @grid = anticlockwise_turn_90_degree(@grid);
}

# print "...\n";
# print "write ###\n";
foreach my $row (@grid) {
    my $result = join '', @{$row};

    print "$result\n";
}

#
# example.
#
# input
#
#    1  2  3  4  5
#    6  7  8  9 10
#   11 12 13 14 15
#
# output
#
#   5 10 15
#   4  9 14
#   3  8 13
#   2  7 12
#   1  6 11
#
sub anticlockwise_turn_90_degree {
    return reverse transpose(@_);
}

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

