<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$MESSAGE = stream_get_line(STDIN, 100 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

// string to 7bit binary.
preg_match_all('/./', $MESSAGE, $chars);
$chars = $chars[0];
$binary = '';
foreach ($chars as $char) {
    $binary .= str_pad(decbin(ord($char)), 7, 0, STR_PAD_LEFT);
}

// create grouping array from 7bit binary
$grouping_array = array();
while (mb_strlen($binary)) {
    $target = mb_substr($binary, 0, 1);
    preg_match("/^$target+/", $binary, $matched);
    $matched = $matched[0];

    array_push($grouping_array, $matched);

    $binary = preg_replace("/^$matched/", '', $binary);
}

//  grouping array to unary
$unary = '';
foreach ($grouping_array as $group) {
    $unary .= str_repeat('0', 2 - mb_substr($group, 0, 1));
    $unary .= ' ';
    $unary .= str_repeat('0', mb_strlen($group));
    $unary .= ' ';
}

// echo("answer\n");
echo rtrim($unary);

?>
