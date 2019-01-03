<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n // the number of temperatures to analyse
);
$inputs = fgets(STDIN);
$inputs = explode(" ",$inputs);
$closest_zero_negative = null;
$closest_zero_positive = null;
for ($i = 0; $i < $n; $i++)
{
    $t = intval($inputs[$i]); // a temperature expressed as an integer ranging from -273 to 5526

    if ($t == 0) {
        $closest_zero_negative = $t;
        $closest_zero_positive = $t;
    } else if ($t < 0 && ($closest_zero_negative ?: -273) <= $t) {
        $closest_zero_negative = $t;
    } else if (0 < $t && $t <= ($closest_zero_positive ?: 5526)) {
        $closest_zero_positive = $t;
    }
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

// echo("result\n");

$np_balance = $closest_zero_negative + $closest_zero_positive;
if ($n == 0) {
    echo 0;
} else if ($closest_zero_positive === null || $closest_zero_negative === null) {
    echo $closest_zero_positive.$closest_zero_negative;
} else if ($np_balance <= 0) {
    echo $closest_zero_positive;
} else {
    echo $closest_zero_negative;
}

?>
