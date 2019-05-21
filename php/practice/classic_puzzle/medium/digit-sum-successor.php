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

$n_str = (string) $N;
$digits = array(0);
foreach (str_split($n_str) as $digit) {
    $digits[] = intval($digit);
}

$decrement_index = -1;
for ($i = count($digits) - 1; $i > 0; $i--) {
    if ($digits[$i] !== 0) {
        $decrement_index = $i;
        break;
    }
}
$digits[$decrement_index]--;

$increment_index = -1;
for ($i = $decrement_index - 1; $i >= 0; $i--) {
    if ($digits[$i] !== 9) {
        $increment_index = $i;
        break;
    }
}
$digits[$increment_index]++;

$be_sort_digits = array_slice($digits, $increment_index + 1);
sort($be_sort_digits);
for ($i = 0; $i < count($be_sort_digits); $i++) {
    $digits[$increment_index + 1 + $i] = $be_sort_digits[$i];
}

// echo("11\n");
echo intval(implode("", $digits));

?>
