use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Don't let the machines win. You are humanity's last hope...

chomp(my $width = <STDIN>); # the number of cells on the X axis
chomp(my $height = <STDIN>); # the number of cells on the Y axis
my @grid;
for my $i (0..$height-1) {
    chomp(my $line = <STDIN>); # width characters, each either 0 or .

    my @row = split '', $line;
    push @grid, \@row;
}

# Write an action using print
# To debug: print STDERR "Debug messages...\n";

# Three coordinates: a node, its right neighbor, its bottom neighbor

my @results;
foreach my $h (0..($height - 1)) {
    foreach my $w (0..($width - 1)) {
        next if $grid[$h][$w] eq '.';

        my $current_node = "$w $h";

        my ($right_index) = grep { $grid[$h][$_] eq 0 } (($w + 1)..($width - 1));
        my $right_node = defined $right_index ? "$right_index $h" : '-1 -1';

        my ($bottom_index) = grep { $grid[$_][$w] eq 0 } (($h + 1)..($height - 1));
        my $bottom_node = defined $bottom_index ? "$w $bottom_index" : '-1 -1';

        my $result = "$current_node $right_node $bottom_node";
        push @results, $result;
    }
}

# print "0 0 1 0 0 1\n";
foreach my $result (@results) {
    print "$result\n";
}

