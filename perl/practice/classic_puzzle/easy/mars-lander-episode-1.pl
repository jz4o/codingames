use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

chomp(my $surface_n = <STDIN>); # the number of points used to draw the surface of Mars.
for my $i (0..$surface_n-1) {
    # land_x: X coordinate of a surface point. (0 to 6999)
    # land_y: Y coordinate of a surface point. By linking all the points together in a sequential fashion, you form the surface of Mars.
    chomp($tokens=<STDIN>);
    my ($land_x, $land_y) = split(/ /,$tokens);
}

# game loop
while (1) {
    # h_speed: the horizontal speed (in m/s), can be negative.
    # v_speed: the vertical speed (in m/s), can be negative.
    # fuel: the quantity of remaining fuel in liters.
    # rotate: the rotation angle in degrees (-90 to 90).
    # power: the thrust power (0 to 4).
    chomp($tokens=<STDIN>);
    my ($x, $y, $h_speed, $v_speed, $fuel, $rotate, $power) = split(/ /,$tokens);

    # Write an action using print
    # To debug: print STDERR "Debug messages...\n";

    my $v_power = $v_speed <= -40 ? 4 : 0;

    # 2 integers: rotate power. rotate is the desired rotation angle (should be 0 for level 1), power is the desired thrust power (0 to 4).

    # print "0 3\n";
    print "0 $v_power\n"
}

