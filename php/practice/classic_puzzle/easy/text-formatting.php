<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$intext = stream_get_line(STDIN, 999 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$require_period = substr($intext, -1) == '.';

$intext = strtolower($intext);

$intext = str_replace(',', ', ', $intext);
$intext = preg_replace('/\s+/', ' ', $intext);

$trim_and_capitalize = function($value){
    return ucfirst(trim($value));
};
$intext = explode('.', $intext);
$intext = join('. ', array_filter(array_map($trim_and_capitalize, $intext)));

$intext = str_replace(' ,', ',', $intext);
$intext = preg_replace('/,+/', ',', $intext);

if ($require_period) $intext .= '.';

// echo("solution\n");

echo $intext;

?>
