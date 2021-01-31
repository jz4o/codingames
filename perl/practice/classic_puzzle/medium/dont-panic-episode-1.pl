use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

# nb_floors: number of floors
# width: width of the area
# nb_rounds: maximum number of rounds
# exit_floor: floor on which the exit is found
# exit_pos: position of the exit on its floor
# nb_total_clones: number of generated clones
# nb_additional_elevators: ignore (always zero)
# nb_elevators: number of elevators
chomp($tokens=<STDIN>);
my ($nb_floors, $width, $nb_rounds, $exit_floor, $exit_pos, $nb_total_clones, $nb_additional_elevators, $nb_elevators) = split(/ /,$tokens);
my @elevator_floors;
my @elevator_positions;
for my $i (0..$nb_elevators-1) {
    # elevator_floor: floor on which this elevator is found
    # elevator_pos: position of the elevator on its floor
    chomp($tokens=<STDIN>);
    my ($elevator_floor, $elevator_pos) = split(/ /,$tokens);

    push @elevator_floors, $elevator_floor;
    push @elevator_positions, $elevator_pos;
}

# game loop
while (1) {
    # clone_floor: floor of the leading clone
    # clone_pos: position of the leading clone on its floor
    # direction: direction of the leading clone: LEFT or RIGHT
    chomp($tokens=<STDIN>);
    my ($clone_floor, $clone_pos, $direction) = split(/ /,$tokens);

    # Write an action using print
    # To debug: print STDERR "Debug messages...\n";

    my ($elevator_index) = grep { $elevator_floors[$_] == $clone_floor } 0..$#elevator_floors;
    my $target = defined $elevator_index ? $elevator_positions[$elevator_index] : $exit_pos;

    my $is_already_facing_left_target = $target < $clone_pos && $direction eq 'LEFT';
    my $is_already_facing_right_target = $clone_pos < $target && $direction eq 'RIGHT';

    my $is_wait = $is_already_facing_left_target || $is_already_facing_right_target || $target == $clone_pos;

    # print "WAIT\n"; # action: WAIT or BLOCK
    print $is_wait ? "WAIT\n" : "BLOCK\n";
}

