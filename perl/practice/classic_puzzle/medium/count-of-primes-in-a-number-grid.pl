use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'uniq';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($r, $c) = split(/ /,$tokens);
my @grid;
for my $i (0..$r-1) {
    chomp(my $row = <STDIN>);

    my @numbers = split ' ', $row;
    push @grid, \@numbers;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @digits;
foreach my $row (@grid) {
    push @digits, @{$row};
}
push @digits, array_combinations(@grid);
push @digits, array_combinations(transpose(@grid));

@digits = uniq @digits;

my $result = grep { is_prime($_) } @digits;

# print "answer\n";
print "$result";

sub array_combinations {
    my @dimension_array = @_;

    my @result;
    foreach my $scalar_row (@dimension_array) {
        my @row = @{$scalar_row};

        foreach my $length (2..scalar(@row)) {
            foreach my $begin_index (0..(scalar(@row) - $length)) {
                my $end_index = $begin_index + $length - 1;

                push @result, int(join '', @row[$begin_index..$end_index]);
            }
        }
    }

    return @result;
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

sub is_prime {
    my ($num) = @_;

    return 0 if $num <= 1;

    foreach my $i (2..int($num / 2)) {
        return 0 if $num % $i == 0;
    }

    return 1;
}

