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
$BASE_NUM = 3;

$reverse_result = array();
preg_match_all('/./', base_convert(abs($N), 10, $BASE_NUM), $digits);
$digits = array_reverse($digits[0]);
for ($index=0; $index<count($digits); $index++){
    $reverse_result[$index] = $reverse_result[$index] ?? 0;
    $target = $reverse_result[$index] += intval($digits[$index]);
    if ($BASE_NUM - 1 <= $target) {
        $reverse_result[$index] -= $BASE_NUM;

        $next_index = $index + 1;
        $reverse_result[$next_index] = ($reverse_result[$next_index] ?? 0) + 1;
    }
}

if ($N < 0) {
    for ($i=0; $i<count($reverse_result); $i++) {
        $reverse_result[$i] = -$reverse_result[$i];
    }
}

// echo("42\n");
for ($i=count($reverse_result)-1; $i>=0; $i--) {
    $d = $reverse_result[$i];
    echo($d < 0 ? 'T' : $d);
}

?>
