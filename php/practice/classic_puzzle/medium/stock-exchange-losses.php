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
    $v = intval($inputs[$i]);
    $inputs[$i] = $v;
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$max_value = 0;
$max_diff  = 0;
for ($index = 0; $index < count($inputs); $index++) {
    $input = $inputs[$index];
    if ($index >= count($inputs) - 1) {
        break;
    }
    if ($max_value >= $input) {
        continue;
    }

    $max_value = $input;

    $min_value = $inputs[$index + 1];
    for ($i = $index + 1; $i < count($inputs); $i++) {
        if ($min_value > $inputs[$i]) {
            $min_value = $inputs[$i];
        }
    }

    $diff = $min_value - $input;
    if ($max_diff > $diff) {
        $max_diff = $diff;
    }
}

// echo("answer\n");
echo $max_diff;

?>
