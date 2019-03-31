<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $W, // width of the building.
    $H // height of the building.
);
fscanf(STDIN, "%d",
    $N // maximum number of turns before game over.
);
fscanf(STDIN, "%d %d",
    $X0,
    $Y0
);

$bomb_min_height = $H;
$bomb_max_height = 0;
$bomb_min_width  = 0;
$bomb_max_width  = $W;

// game loop
while (TRUE)
{
    fscanf(STDIN, "%s",
        $bombDir // the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)
    );

    // Write an action using echo(). DON'T FORGET THE TRAILING \n
    // To debug (equivalent to var_dump): error_log(var_export($var, true));

    if (strpos($bombDir, 'U') !== false) {
        $bomb_min_height = $Y0;
        $Y0 -= ceil(($Y0 - $bomb_max_height) / 2);
    } else if (strpos($bombDir, 'D') !== false) {
        $bomb_max_height = $Y0;
        $Y0 += ceil(($bomb_min_height - $Y0) / 2);
    }

    if (strpos($bombDir, 'R') !== false) {
        $bomb_min_width = $X0;
        $X0 += ceil(($bomb_max_width - $X0) / 2);
    } else if (strpos($bombDir, 'L') !== false) {
        $bomb_max_width = $X0;
        $X0 -= ceil(($X0 - $bomb_min_width) / 2);
    }

    // the location of the next window Batman should jump to.
    // echo("0 0\n");
    echo $X0.' '.$Y0."\n";
}

?>
