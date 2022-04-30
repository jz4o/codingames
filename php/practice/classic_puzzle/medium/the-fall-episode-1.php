<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $W, // number of columns.
    $H // number of rows.
);
$lines = array();
for ($i = 0; $i < $H; $i++)
{
    $LINE = stream_get_line(STDIN, 200 + 1, "\n"); // represents a line in the grid and contains W integers. Each integer represents one room of a given type.
    array_push($lines, explode(' ', $LINE));
}
fscanf(STDIN, "%d",
    $EX // the coordinate along the X axis of the exit (not useful for this first mission, but must be read).
);

// // direction
$top    = 0;
$left   = 1;
$right  = 2;
$bottom = 3;
$none   = null;

// panel
// key   : direction of entrance
// value : array of direction of exit ( index of array is type of panel )
$panel_destination = array(
    'TOP'   => array($none, $bottom, $none,  $bottom, $left,   $right,  $none,  $bottom, $none,   $bottom, $left, $right, $none,   $none),
    'LEFT'  => array($none, $bottom, $right, $none,   $none,   $bottom, $right, $none,   $bottom, $bottom, $none, $none,  $none,   $bottom),
    'RIGHT' => array($none, $bottom, $left,  $none,   $bottom, $none,   $left,  $bottom, $bottom, $none,   $none, $none,  $bottom, $none)
);

// game loop
while (TRUE)
{
    fscanf(STDIN, "%d %d %s",
        $XI,
        $YI,
        $POS
    );

    // Write an action using echo(). DON'T FORGET THE TRAILING \n
    // To debug (equivalent to var_dump): error_log(var_export($var, true));

    $panel_type = intval($lines[$YI][$XI]);
    $next_destination = $panel_destination[$POS][$panel_type];

    if ($next_destination === $left) {
        $XI--;
    } else if ($next_destination === $right) {
        $XI++;
    } else if ($next_destination === $bottom) {
        $YI++;
    }

    // One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.
    // echo("0 0\n");
    echo $XI,' '.$YI."\n";
}

?>
