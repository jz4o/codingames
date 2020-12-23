use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chomp(my $n = <STDIN>);
my @grid;
for my $i (0..$n-1) {
    chomp(my $row = <STDIN>);

    my @row_masses = split //, $row;

    push @grid, \@row_masses;
}
for my $i (0..$n-1) {
    chomp(my $row = <STDIN>);

    my @row_masses = split //, $row;
    while (my ($index, $mass) = each @row_masses) {
        @{$grid[$i]}[$index] += $mass;
    }
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my $BORDER = 4;

while (grep { grep { $_ >= $BORDER } @{$_} } @grid) {
    while (my ($row_index, $row) = each @grid) {
        while (my ($column_index, $value) = each @{$row}) {
            if ($value < $BORDER) {
                next;
            }

            @{$grid[$row_index]}[$column_index] -= $BORDER;
            if ($row_index > 0) { @{$grid[$row_index - 1]}[$column_index]++; }          # above
            if ($row_index + 1 != $n) { @{$grid[$row_index + 1]}[$column_index]++; }    # below
            if ($column_index > 0) { @{$grid[$row_index]}[$column_index - 1]++; }       # left
            if ($column_index + 1 != $n) { @{$grid[$row_index]}[$column_index + 1]++; } # right
        }
    }
}

# print "answer\n";
foreach my $row (@grid) {
    my $result = join '', @{$row};
    print "$result\n";
}

