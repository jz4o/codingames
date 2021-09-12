use strict;
use warnings;
#use diagnostics;
use 5.32.1;

use List::Util 'max';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @grid = ();
for my $i (0..$n-1) {
    chomp(my $line = <STDIN>);

    my @line_chars = split '', $line;
    push @grid, \@line_chars;
}

my $width = max(map { my $length = @{$_}; $length } @grid) + 2;

foreach my $index (0..$n - 1) {
    my $row_length = @{$grid[$index]};
    foreach (1..$width - $row_length) {
        push @{$grid[$index]}, ' ';
    }
}

my @shadow_row_1 = split('', ' ' x $width);
my @shadow_row_2 = split('', ' ' x $width);
push @grid, \@shadow_row_1;
push @grid, \@shadow_row_2;

foreach my $row_index (reverse 0..$n + 1) {
    foreach my $column_index (reverse 0..$width - 1) {
        if (@{$grid[$row_index]}[$column_index] ne ' ') {
            next;
        }

        if ($row_index >= 2 && $column_index >= 2 && @{$grid[$row_index - 2]}[$column_index - 2] ne ' ') {
            @{$grid[$row_index]}[$column_index] = '`';
        }

        if ($row_index >= 1 && $column_index >= 1 && @{$grid[$row_index - 1]}[$column_index - 1] ne ' ') {
            @{$grid[$row_index]}[$column_index] = '-';
        }
    }
}

foreach my $row (@grid) {
    my $result_row = join '', @{$row};
    $result_row =~ s/\s*$//;

    print "$result_row\n";
}
