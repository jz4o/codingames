<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$sum = 0;
for ($i = 1; $i <= $n; $i++) {
    $sum += intval($n / $i) * $i;
}

// echo("sum\n");
echo $sum;

?>
