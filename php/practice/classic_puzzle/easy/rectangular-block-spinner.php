<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $size
);
fscanf(STDIN, "%d",
    $angle
);
$map = array();
for ($i = 0; $i < $size; $i++)
{
    $line = stream_get_line(STDIN, 1024 + 1, "\n");
    array_push($map, explode(" ", $line));
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$diagonal_size = $size * 2 - 1;
$rotate_count  = (($angle - 45) % 360) / 90;

for ($i = 0; $i < $rotate_count; $i++) {
    $map = anticlockwise_turn_90_degree($map);
}

$diamond_map = array();
for ($time = 1; $time <= $diagonal_size; $time++) {
    $start = max(0, $time - $size);
    $pop_line_size = min($time, $size * 2 - $time);

    $line = array();

    for ($s = 0; $s < $pop_line_size; $s++) {
        array_push($line, array_pop($map[$start + $s]));
    }
    array_push($diamond_map, $line);
}

// echo("answer\n");
for ($i = 0; $i < count($diamond_map); $i++) {
    $line = $diamond_map[$i];
    echo str_pad(implode(" ", $line), $diagonal_size, " ", STR_PAD_BOTH)."\n";
}


/**
 * example.
 *
 * input
 *
 *   1 2 3
 *   4 5 6
 *   7 8 9
 *
 * output
 *
 *   3 6 9
 *   2 5 8
 *   1 4 7
 */
function anticlockwise_turn_90_degree($array) {
    $size = count($array);

    $result = array();
    for ($to_row = 0; $to_row < $size; $to_row++) {
        $line = array();
        for ($from_row = 0; $from_row < $size; $from_row++) {
            array_push($line, array_pop($array[$from_row]));
        }
        array_push($result, $line);
    }

    return $result;
}

?>
