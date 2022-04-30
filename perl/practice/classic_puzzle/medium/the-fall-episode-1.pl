use strict;
use warnings;
#use diagnostics;
use 5.20.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

my $tokens;

# w: number of columns.
# h: number of rows.
chomp($tokens=<STDIN>);
my ($w, $h) = split(/ /,$tokens);
my @grid;
for my $i (0..$h-1) {
    chomp(my $line = <STDIN>); # represents a line in the grid and contains W integers. Each integer represents one room of a given type.

    my @panels = split ' ', $line;
    push @grid, \@panels;
}
chomp(my $ex = <STDIN>); # the coordinate along the X axis of the exit (not useful for this first mission, but must be read).

# direction
my $TOP    = 0;
my $LEFT   = 1;
my $RIGHT  = 2;
my $BOTTOM = 3;
my $NONE = '';

# Key   : direction of entrance
# Value : direction of exit(index: type of panel)
my %PANEL_DESTINATION;
push @{$PANEL_DESTINATION{'TOP'}},   ($NONE, $BOTTOM, $NONE,  $BOTTOM, $LEFT,   $RIGHT,  $NONE,  $BOTTOM, $NONE,   $BOTTOM, $LEFT, $RIGHT, $NONE,   $NONE);
push @{$PANEL_DESTINATION{'LEFT'}},  ($NONE, $BOTTOM, $RIGHT, $NONE,   $NONE,   $BOTTOM, $RIGHT, $NONE,   $BOTTOM, $BOTTOM, $NONE, $NONE,  $NONE,   $BOTTOM);
push @{$PANEL_DESTINATION{'RIGHT'}}, ($NONE, $BOTTOM, $LEFT,  $NONE,   $BOTTOM, $NONE,   $LEFT,  $BOTTOM, $BOTTOM, $NONE,   $NONE, $NONE,  $BOTTOM, $NONE);

# game loop
while (1) {
    chomp($tokens=<STDIN>);
    my ($xi, $yi, $pos) = split(/ /,$tokens);
    
    # Write an action using print
    # To debug: print STDERR "Debug messages...\n";

    my $panel_type = $grid[$yi][$xi];
    my $next_dest = @{$PANEL_DESTINATION{$pos}}[$panel_type];

    my $next_xi = $xi;
    my $next_yi = $yi;
    if ($next_dest == $LEFT) {
        $next_xi--;
    } elsif ($next_dest == $RIGHT) {
        $next_xi++;
    } elsif ($next_dest == $BOTTOM) {
        $next_yi++;
    }

    # One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.

    # print "0 0\n";
    print "$next_xi $next_yi\n";
}

