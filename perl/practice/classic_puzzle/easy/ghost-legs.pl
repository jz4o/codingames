use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp($tokens=<STDIN>);
my ($w, $h) = split(/ /,$tokens);
my @grid;
for my $i (0..$h-1) {
    chomp(my $line = <STDIN>);

    my @row;

    my @chars = (' ', split '', $line);
    while (my ($index, $char) = each @chars) {
        if ($index == $#chars || $char ne $chars[$index + 1]) {
            push @row, $char;
        }
    }

    push @grid, \@row;
}

# Write an answer using print
# To debug: print STDERR "Debug messages...\n";

my @top_line = @{shift @grid};
my @bottom_line = @{pop @grid};

foreach my $line (reverse @grid) {
    while (my ($index, $char) = each @{$line}) {
        if ($char eq '-') {
            ($bottom_line[$index - 1], $bottom_line[$index + 1]) = ($bottom_line[$index + 1], $bottom_line[$index - 1]);
        }
    }
}

my @results;
while (my ($index, $char) = each @top_line) {
    if ($char ne ' ') {
        push @results, "$char$bottom_line[$index]";
    }
}

# print "answer\n";
foreach my $result (@results) {
    print "$result\n";
}

