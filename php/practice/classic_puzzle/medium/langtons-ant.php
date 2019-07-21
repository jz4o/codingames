<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

define('BLACK', '#');
define('WHITE', '.');
$directions = array('N', 'E', 'S', 'W');

fscanf(STDIN, "%d %d",
    $W,
    $H
);
fscanf(STDIN, "%d %d",
    $x,
    $y
);
fscanf(STDIN, "%s",
    $direction
);
$sliced_directions = array_splice($directions, 0, array_search($direction, $directions));
$directions = array_merge($directions, $sliced_directions);
fscanf(STDIN, "%d",
    $T
);
$map = array();
for ($i = 0; $i < $H; $i++)
{
    $C = stream_get_line(STDIN, 30 + 1, "\n");
    array_push($map, str_split($C));
}
for ($i = 0; $i < $T; $i++)
{

    // Write an action using echo(). DON'T FORGET THE TRAILING \n
    // To debug (equivalent to var_dump): error_log(var_export($var, true));

    if ($map[$y][$x] === BLACK) {
        $first_direction = array_splice($directions, 0, 1);
        $directions = array_merge($directions, $first_direction);

        $map[$y][$x] = WHITE;
    } else {
        $last_direction = array_splice($directions, count($directions) - 1, 1);
        $directions = array_merge($last_direction, $directions);

        $map[$y][$x] = BLACK;
    }

    switch ($directions[0]) {
        case 'N':
            $y--;
            break;
        case 'E':
            $x++;
            break;
        case 'W':
            $x--;
            break;
        case 'S':
            $y++;
            break;
    }

    // echo("answer\n");
}

foreach ($map as $row) {
    echo implode('', $row)."\n";
}

?>
