<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $n,
    $k
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$results = array();
$temps = array();
for ($i = 1; $i <= $k; $i++) {
    array_push($temps, array($i));
}

while (count($temps) > 0) {
    $temp = array_pop($temps);
    if (array_sum($temp) === $n) {
        array_push($results, $temp);
    } else if (array_sum($temp) < $n) {
        for ($i = 1; $i <= $k; $i++) {
            array_push($temps, array_merge($temp, array($i)));
        }
    }
}

// echo("answer\n");
foreach (array_reverse($results) as $result) {
    echo implode(' ', $result)."\n";
}

?>
