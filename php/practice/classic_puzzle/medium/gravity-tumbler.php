<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $width,
    $height
);
fscanf(STDIN, "%d",
    $count
);
$results = array();
for ($i = 0; $i < $height; $i++)
{
    $raster = stream_get_line(STDIN, $width + 1, "\n");
    array_push($results, str_split($raster));
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

for ($i = 0; $i < $count; $i++) {
    for ($result_row = 0; $result_row < count($results); $result_row++) {
        asort($results[$result_row]);
    }

    $results = anticlockwise_turn_90_degree($results);
}

// echo("...\n");
// echo("write ###\n");

foreach ($results as $result) {
    echo implode("", $result)."\n";
}

/**
 * example.
 *
 * input
 *
 *    1  2  3  4  5
 *    6  7  8  9 10
 *   11 12 13 14 15
 *
 * output
 *
 *   5 10 15
 *   4  9 14
 *   3  8 13
 *   2  7 12
 *   1  6 11
 */
function anticlockwise_turn_90_degree($array) {
    $result_row_size = count($array[0]);
    $result_column_size = count($array);

    $result = array();
    for ($to_row = 0; $to_row < $result_row_size; $to_row++) {
        $line = array();
        for ($from_row = 0; $from_row < $result_column_size; $from_row++) {
            array_push($line, array_pop($array[$from_row]));
        }
        array_push($result, $line);
    }

    return $result;
}

?>
