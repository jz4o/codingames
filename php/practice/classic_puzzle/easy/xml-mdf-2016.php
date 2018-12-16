<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$sequence = stream_get_line(STDIN, 1024 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$depths = array();
$depth = 0;

while(strlen($sequence) > 0) {
    $char = mb_substr($sequence, 0, 1);
    $sequence = mb_substr($sequence, 1);

    if ($char == '-') {
        $char = mb_substr($sequence, 0, 1);
        $sequence = mb_substr($sequence, 1);
        $depths[$char] = $depths[$char] ?? array();
        array_push($depths[$char], $depth);
        $depth--;
    } else {
        $depth++;
    }
}

foreach ($depths as $k => $v) {
    $get_rational = function($value){
        return $value == 0 ? 0 : 1 / $value;
    };
    $depths[$k] = array_sum(array_map($get_rational, $v));
}

// echo("answer\n");

$maximum_key = null;
$maximum_value = null;
foreach ($depths as $k => $v) {
    if  (!isset($maximum_value) || $maximum_value < $v) {
        $maximum_key = $k;
        $maximum_value = $v;
    }
}

echo $maximum_key;

?>
