<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$initial_array = $array = range(1, $N);
$center_index  = intval(count($initial_array) / 2);
$progress_log  = array();

for ($i = 0; $i < $N; $i++) {
    $front_half = array_slice($array, 0, $center_index);
    $back_half  = array_reverse(array_slice($array, $center_index));

    $array = array();
    for ($j = 0; $j < max(count($front_half), count($back_half)); $j++) {
        if ($j < count($back_half)) {
            array_push($array, $back_half[$j]);
        }

        if ($j < count($front_half)) {
            array_push($array, $front_half[$j]);
        }
    }

    array_push($progress_log, implode(',', $array));
}

// echo("IMPOSSIBLE\n");
echo $array === $initial_array ? implode("\n", $progress_log) : 'IMPOSSIBLE';

?>
