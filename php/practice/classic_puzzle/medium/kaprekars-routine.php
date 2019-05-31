<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$n1 = stream_get_line(STDIN, 10 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$digits_size = strlen($n1);
$answers = array();

$n1_format = "%0".$digits_size."d";

while (!in_array($n1, $answers)) {
    array_push($answers, $n1);

    $n1_chars = str_split($n1);
    sort($n1_chars);
    $r = intval(implode("", $n1_chars));
    $n1_chars = array_reverse($n1_chars);
    $l = intval(implode("", $n1_chars));

    $answer = $l - $r;
    $n1 = sprintf($n1_format, $answer);
}

// echo("1 2 3 4\n");
$index = array_search($n1, $answers);
echo implode(" ", array_slice($answers, $index));

?>
