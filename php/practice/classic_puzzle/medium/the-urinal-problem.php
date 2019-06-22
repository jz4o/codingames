<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$B = stream_get_line(STDIN, 100 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$free_indexes = range(0, $N - 1);

$go_right_indexes = array();
$go_left_indexes  = array();
foreach (str_split($B) as $key => $value) {
    if ($value === '!') {
        array_push($go_right_indexes, $key);
        array_push($go_left_indexes, $key);
    }
}

while (count($free_indexes) > 1) {
    $free_indexes = array_diff($free_indexes, $go_right_indexes, $go_left_indexes);

    for ($i = 0; $i < count($go_left_indexes); $i++) {
        $go_left_indexes[$i]--;
    }
    for ($i = 0; $i < count($go_right_indexes); $i++) {
        $go_right_indexes[$i]++;
    }
}

// echo("0\n");
echo current($free_indexes);

?>
