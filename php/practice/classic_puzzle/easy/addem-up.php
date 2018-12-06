<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$inputs = fgets(STDIN);
$inputs = explode(" ",$inputs);
$integers = array();
for ($i = 0; $i < $N; $i++)
{
    $x = intval($inputs[$i]);
    array_push($integers, $x);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$total_cost = 0;
while(count($integers) >= 2) {
    sort($integers);
    $integer1 = array_shift($integers);
    $integer2 = array_shift($integers);

    $cost = $integer1 + $integer2;
    $total_cost += $cost;
    array_push($integers, $cost);
}

echo($total_cost);

?>
