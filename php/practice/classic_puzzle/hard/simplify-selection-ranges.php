<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$N = stream_get_line(STDIN, 100 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

function get_range_str($items) {
    if (count($items) >= 3) {
        return $items[0].'-'.$items[count($items) - 1];
    } else {
        return implode(',', $items);
    }
}

$numbers = array_map('intval', explode(',', substr($N, 1, -1)));
sort($numbers);

$temp = array();
$results = array();
foreach ($numbers as $number) {
    if (!empty($temp) && $temp[count($temp) - 1] + 1 !== $number) {
        array_push($results, get_range_str($temp));
        $temp = array();
    }
    array_push($temp, $number);
}
array_push($results, get_range_str($temp));

// echo("answer\n");
echo implode(',', $results);

?>
