<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $W,
    $H
);
$map = array_fill(0, $H + 1, array_fill(0, $W + 1, 0));
for ($i = 0; $i < $H; $i++)
{
    $inputs = explode(" ", fgets(STDIN));
    for ($j = 0; $j < $W; $j++)
    {
        $food = intval($inputs[$j]);
        $map[$i + 1][$j + 1] = $food;
    }
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

for ($h = 1; $h <= $H; $h++) {
    for ($w = 1; $w <= $W; $w++) {
        $top  = $map[$h - 1][$w];
        $left = $map[$h][$w - 1];

        $map[$h][$w] += max($top, $left);
    }
}

// echo("answer\n");
echo $map[$H][$W];

?>
