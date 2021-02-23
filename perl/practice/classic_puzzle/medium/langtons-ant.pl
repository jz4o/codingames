use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

my $BLACK = '#';
my $WHITE = '.';

my @directions = ('N', 'E', 'S', 'W');

chomp($tokens=<STDIN>);
my ($w, $h) = split(/ /,$tokens);
chomp($tokens=<STDIN>);
my ($x, $y) = split(/ /,$tokens);
chomp(my $direction = <STDIN>);
while ($directions[0] ne $direction) {
    push @directions, shift(@directions);
}
chomp(my $t = <STDIN>);
my @grid;
for my $i (0..$h-1) {
    chomp(my $c = <STDIN>);

    my @row = split '', $c;
    push @grid, \@row;
}
for my $i (0..$t-1) {

    # Write an answer using print
    # To debug: print STDERR "Debug messages...\n";

    if ($grid[$y][$x] eq $BLACK) {
        push @directions, shift(@directions);
        $grid[$y][$x] = $WHITE;
    } else {
        unshift @directions, pop(@directions);
        $grid[$y][$x] = $BLACK;
    }

    my $d = $directions[0];
    if ($d eq 'N') {
        $y--;
    } elsif ($d eq 'E') {
        $x++;
    } elsif ($d eq 'W') {
        $x--;
    } elsif ($d eq 'S') {
        $y++;
    }
}

# print "answer\n";
foreach my $row (@grid) {
    my $result = join '', @{$row};
    print "$result\n";
}

