use strict;
use warnings;
#use diagnostics;
use 5.20.1;

use POSIX 'ceil';

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

# w: width of the building.
# h: height of the building.
chomp($tokens=<STDIN>);
my ($w, $h) = split(/ /,$tokens);
chomp(my $n = <STDIN>); # maximum number of turns before game over.
chomp($tokens=<STDIN>);
my ($x0, $y0) = split(/ /,$tokens);

my $bomb_min_height = $h;
my $bomb_max_height = 0;
my $bomb_min_width = 0;
my $bomb_max_width = $w;

my $x = $x0;
my $y = $y0;

# game loop
while (1) {
    chomp(my $bomb_dir = <STDIN>); # the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

    # Write an action using print
    # To debug: print STDERR "Debug messages...\n";

    if ($bomb_dir =~ m/U/) {
        $bomb_min_height = $y;
        $y -= ceil(($y - $bomb_max_height) / 2);
    } elsif ($bomb_dir =~ m/D/) {
        $bomb_max_height = $y;
        $y += ceil(($bomb_min_height - $y) / 2);
    }

    if ($bomb_dir =~ m/R/) {
        $bomb_min_width = $x;
        $x += ceil(($bomb_max_width - $x) / 2);
    } elsif ($bomb_dir =~ m/L/) {
        $bomb_max_width = $x;
        $x -= ceil(($x - $bomb_min_width) / 2);
    }

    # the location of the next window Batman should jump to.

    # print "0 0\n";
    print "$x $y\n";
}

