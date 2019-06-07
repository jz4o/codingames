<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $start,
    $n
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$zero_string_size = strlen('zero');
$one_string_size  = strlen('one');

for ($i = 0; $i < $n; $i++) {
    $binary = base_convert($start, 10, 2);
    $zero_value = substr_count($binary, '0') * $zero_string_size;
    $one_value  = substr_count($binary, '1') * $one_string_size;
    $result = $zero_value + $one_value;

    if ($start === $result) {
        break;
    }

    $start = $result;
}

// echo("42\n");
echo $start;

?>
