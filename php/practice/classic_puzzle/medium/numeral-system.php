<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$equality = stream_get_line(STDIN, 100 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$numeral_string = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

$xyz = preg_split("/[\+=]/", $equality);
$x = $xyz[0];
$y = $xyz[1];
$z = $xyz[2];

$max_numeral_index = -1;
foreach (str_split($equality) as $equality_char) {
    $numeral_index = strpos($numeral_string, $equality_char);
    if ($numeral_index > $max_numeral_index) {
        $max_numeral_index = $numeral_index;
    }
}
$max_numeral_index++;

$result = -1;
for ($i = $max_numeral_index; $i <= strlen($numeral_string); $i++) {
        $numeral_x = base_convert($x, $i, 10);
        $numeral_y = base_convert($y, $i, 10);
        $numeral_z = base_convert($z, $i, 10);
        if ($numeral_x + $numeral_y == $numeral_z) {
            $result = $i;
            break;
    }
}

// echo("answer\n");
echo $result;

?>
