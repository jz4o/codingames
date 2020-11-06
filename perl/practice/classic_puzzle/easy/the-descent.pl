use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE
# The while loop represents the game.
# Each iteration represents a turn of the game
# where you are given inputs (the heights of the mountains)
# and where you have to print an output (the index of the mountain to fire on)
# The inputs you are given are automatically updated according to your last actions.


# game loop
while (1) {
    my $maximum_height = 0;
    my $target_index = -1;
    for my $i (0..7) {
        chomp(my $mountain_h = <STDIN>); # represents the height of one mountain.

        if ($maximum_height < $mountain_h) {
            $maximum_height = $mountain_h;
            $target_index = $i;
        }
    }

    # Write an action using print
    # To debug: print STDERR "Debug messages...\n";

    # print "4\n"; # The index of the mountain to fire on.
    print "$target_index\n";
}

