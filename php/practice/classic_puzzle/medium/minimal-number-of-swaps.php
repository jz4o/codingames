<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n
);
$inputs = fgets(STDIN);
$inputs = explode(" ",$inputs);
for ($i = 0; $i < $n; $i++)
{
    $x = intval($inputs[$i]);
    $inputs[$i] = $x;
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$l_index = -1;
$r_index = count($inputs);
$turn = 0;
while ($l_index < $r_index) {
    // next zero from left
    $l_index++;
    while ($l_index < count($inputs) && $inputs[$l_index] !== 0) {
        $l_index++;
    }

    // next one from right
    $r_index--;
    while ($r_index >= 0 && $inputs[$r_index] !== 1) {
        $r_index--;
    }

    $turn++;
}

// echo("answer\n");
echo $turn - 1;

?>
