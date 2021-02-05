use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
chomp(my $x = <STDIN>);
my @grid;
for my $i (0..$n-1) {
    chomp(my $line = <STDIN>);

    my @row = split '', $line;
    push @grid, \@row;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

# array to string
my $chars = '';
my @transposed_grid = transpose(@grid);
while (my ($index, $scalar_row) = each @transposed_grid) {
    my @row = @{$scalar_row};
    @row = reverse @row if $index % 2 == 0;

    $chars .= join '', @row;
}

# rotate
my $char_string_length = length $chars;
my $rotate_begin_index = $char_string_length - $x;
my $rotate_end_index = $rotate_begin_index + $char_string_length;

$chars = substr $chars x 2, $rotate_begin_index, $rotate_end_index - $rotate_begin_index;

# string to array
my @rotated_grid;
my @splited_chars = $chars =~ m/.{$n}/g;
while (my ($index, $matched) = each (@splited_chars)) {
    my @row = split '', $matched;
    @row = reverse @row if $index % 2 == 0;

    push @rotated_grid, \@row;
}
@rotated_grid = transpose(@rotated_grid);

# print "answer\n";
foreach my $row (@rotated_grid) {
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

