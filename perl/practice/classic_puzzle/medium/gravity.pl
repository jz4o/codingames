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
my @grid;
for my $i (0..$height-1) {
    chomp(my $line = <STDIN>);

    my @row = split '', $line;
    push @grid, \@row;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @transposed_grid = transpose(@grid);
while (my ($index, $row) = each @transposed_grid) {
    my @sorted_row = reverse sort @{$row};
    $transposed_grid[$index] = \@sorted_row;
}
my @moved_grid = transpose(@transposed_grid);

# print "answer\n";
foreach my $row (@moved_grid) {
    my $result = join '', @{$row};
    print "$result\n";
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

