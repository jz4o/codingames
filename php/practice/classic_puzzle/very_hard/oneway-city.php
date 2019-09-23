<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $M
);
fscanf(STDIN, "%d",
    $N
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$short_distance = min($M, $N) - 1;
$long_distance  = max($M, $N) - 1;

if ($short_distance <= 0) {
    echo 1;
    return;
}

$mole_combination = '1';
for ($i = $long_distance + 1; $i <= $short_distance + $long_distance; $i++) {
    $mole_combination = bcmul($mole_combination, strval($i));
}
$deno_combination = '1';
for ($i = 1; $i <= $short_distance; $i++) {
    $deno_combination = bcmul($deno_combination, strval($i));
}

$movable_combination = bcdiv($mole_combination, $deno_combination);
$significant_digits  = $movable_combination;
if (strlen($significant_digits) >= 1000) {
    $significant_digits = substr($significant_digits, 0, 1000);
}

// echo("answer\n");
echo $significant_digits;

?>
