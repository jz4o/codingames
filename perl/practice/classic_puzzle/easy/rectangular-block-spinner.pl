use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use List::Util 'max', 'min';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $size = <STDIN>);
chomp(my $angle = <STDIN>);
my @map;
for my $i (0..$size-1) {
    chomp(my $line = <STDIN>);

    my @line = split ' ', $line;
    push @map, \@line;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $diagonal_size = $size * 2 - 1;
my $rotate_count = (($angle - 45) % 360) / 90;

foreach my $i (0..($rotate_count - 1)) {
    @map = anticlockwise_turn_90_degree(@map);
}

my @diamond_map;
foreach my $time (1..$diagonal_size) {
    my $start = max(0, $time - $size);
    my $pop_line_size = min($time, $size * 2 - $time);

    my @line;
    foreach my $s (0..($pop_line_size - 1)) {
        push @line, pop(@{$map[$start + $s]});
    }
    push @diamond_map, \@line;
}

# print "answer\n";
foreach my $line (@diamond_map) {
    my $result_line = center_string((join ' ', @{$line}), $diagonal_size, ' ');
    print "$result_line\n";
}


#  example.
#
#  input
#
#    1 2 3
#    4 5 6
#    7 8 9
#
#  output
#
#    3 6 9
#    2 5 8
#    1 4 7
sub anticlockwise_turn_90_degree {
    my @map = @_;

    my $size = scalar @map;

    my @result;
    foreach my $to_row (0..($size - 1)) {
        my @line;
        foreach my $from_row (0..($size - 1)) {
            push @line, pop(@{$map[$from_row]});
        }

        push @result, \@line;
    }

    return @result;
}

# examples.
#
# centerString("abc", 5, " ")
#     => " abc "
#
# centerString("abc", 4, " ")
#     => "abc "
#
# centerString("abc", 2, " ")
#     => "abc"
sub center_string {
    my ($str, $size, $pad) = @_;

    my $result = $str;
    foreach my $c (0..($size - length($str) - 1)) {
        if ($c % 2 == 0) {
            $result .= $pad;
        } else {
            $result = $pad . $result;
        }
    }

    return $result;
}

