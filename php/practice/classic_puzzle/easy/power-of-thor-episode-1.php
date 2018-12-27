<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 * ---
 * Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.
 **/

fscanf(STDIN, "%d %d %d %d",
    $lightX, // the X position of the light of power
    $lightY, // the Y position of the light of power
    $initialTX, // Thor's starting X position
    $initialTY // Thor's starting Y position
);

// game loop
while (TRUE)
{
    fscanf(STDIN, "%d",
        $remainingTurns // The remaining amount of turns Thor can move. Do not remove this line.
    );

    // Write an action using echo(). DON'T FORGET THE TRAILING \n
    // To debug (equivalent to var_dump): error_log(var_export($var, true));

    // Initialize Direction
    $move_x = '';
    $move_y = '';

    // deguage X
    if ($lightX < $initialTX) {
        $move_x = 'W';
        $initialTX -= 1;
    } else if ($initialTX < $lightX) {
        $move_x = 'E';
        $initialTX += 1;
    }

    # duguage Y
    if ($lightY < $initialTY) {
        $move_y = 'N';
        $initialTY -= 1;
    } else if ($initialTY < $lightY) {
        $move_y = 'S';
        $initialTY += 1;
    }

    // A single line providing the move to be made: N NE E SE S SW W or NW
    // echo("SE\n");

    echo $move_y.$move_x."\n";
}

?>
