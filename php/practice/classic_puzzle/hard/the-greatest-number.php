<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$input = stream_get_line(STDIN, 30 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$minus_flag = false;
if (strpos($input, '-') !== false) {
    $minus_flag = true;
    $input = str_replace('-', '', $input);
}

$dot_flag = false;
if (strpos($input, '.') !== false) {
    $dot_flag = true;
    $input = str_replace('.', '', $input);
}

$input = str_replace(' ', '', $input);
$inputs = array_map('intval', str_split($input));

$result = '';
if ($minus_flag) {
    sort($inputs);
    $result = implode('', $inputs);
    if ($dot_flag) {
        $result = substr_replace($result, '.', 1, 0);
    }
    $result = '-'.$result;
    if (preg_match('/^-0\.0+$/', $result)) {
        $result = '0';
    }
} else {
    sort($inputs);
    $inputs = array_reverse($inputs);
    $result = implode('', $inputs);
    if ($dot_flag) {
        $result = substr_replace($result, '.', -1, 0);
    }
    if (substr($result, -2) === '.0') {
        $result = substr($result, 0, -2);
    }
}

// echo("greatest\n");
echo $result

?>
