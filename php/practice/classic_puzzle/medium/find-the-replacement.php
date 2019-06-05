<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$X = stream_get_line(STDIN, 99 + 1, "\n");
$Y = stream_get_line(STDIN, 99 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

// create replace table
$replace_map = array();
for ($i = 0; $i < strlen($X); $i++) {
    if ($X[$i] != $Y[$i]) {
        $replace_map[$X[$i]] = $Y[$i];
    }
}

// do replace
$replaced_str = '';
foreach (str_split($X) as $s) {
  $replaced_str .= $replace_map[$s] ?? $s;
}

//check
$result = '';
if ($X === $Y) {
    $result = 'NONE';
} else if ($replaced_str === $Y) {
    $result_elements = array();
    foreach ($replace_map as $key => $value) {
        array_push($result_elements, $key.'->'.$value);
    }
    $result = implode("\n", $result_elements);
} else {
    $result = "CAN'T";
}

// echo("anwser\n");
echo $result."\n";

?>
