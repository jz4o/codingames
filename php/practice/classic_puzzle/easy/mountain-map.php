<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

// $n: the number of mountains
fscanf(STDIN, "%d", $n);
$inputs = explode(" ", fgets(STDIN));
$heights = [];
for ($i = 0; $i < $n; $i++)
{
    $height = intval($inputs[$i]); // height of the mountain

    array_push($heights, $height);
}

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

$max_height = max($heights);

$transposed_map = [];
foreach ($heights as $height) {
    foreach (range(0, $height - 1) as $h) {
        $chars = str_split(str_repeat(' ', $max_height - $h - 1).'/'.str_repeat(' ', $h));
        array_push($transposed_map, $chars);
    }
    foreach (range(0, $height - 1) as $h) {
        $chars = str_split(str_repeat(' ', $max_height - $height + $h).'\\'.str_repeat(' ', $height - $h - 1));
        array_push($transposed_map, $chars);
    }
}

$map = array_transpose($transposed_map);

// echo("answer\n");
foreach ($map as $row) {
    echo(rtrim(implode('', $row))."\n");
}

function array_transpose($grid) {
    return array_map(null, ...$grid);
}

?>
