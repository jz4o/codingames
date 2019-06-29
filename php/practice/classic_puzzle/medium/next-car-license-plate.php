<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$x = stream_get_line(STDIN, 9 + 1, "\n");
fscanf(STDIN, "%d",
    $n
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

define('ALPHAS', array(
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
    'U', 'V', 'W', 'X', 'Y', 'Z'
));

$x_elements = explode('-', $x);
$ab  = $x_elements[0];
$cde = intval($x_elements[1]);
$fg  = $x_elements[2];

$alpha = $ab.$fg;
$alpha_int = alpha_to_int($alpha);
$cde += $n - 1;

$carry = intval($cde / 999);
$cde = $cde % 999;
$alpha_int += $carry;
$alpha = int_to_alpha($alpha_int);

$ab = substr($alpha, 0, 2);
$cde = str_pad($cde + 1, 3, 0, STR_PAD_LEFT);
$fg = substr($alpha, strlen($alpha) - 2);

// echo("AA-000-AA\n");
echo $ab.'-'.$cde.'-'.$fg;

function alpha_to_int($alpha) {
    $result = 0;

    $alpha_elements = str_split($alpha);
    $alpha_elements_size = count($alpha_elements);
    for ($i = 0; $i < $alpha_elements_size; $i++) {
        $a = $alpha_elements[$alpha_elements_size - 1 - $i];
        $alpha_index = array_search($a, ALPHAS) + 1;
        $result += pow(count(ALPHAS), $i) * $alpha_index;
    }

    return $result;
}

function int_to_alpha($int) {
    $result = '';
    while ($int > 0) {
        $i = $int % count(ALPHAS);
        if ($i === 0) {
            $i = count(ALPHAS);
            $int--;
        }

        $int = $int > count(ALPHAS) ? intval($int / count(ALPHAS)) : 0;
        $result = ALPHAS[$i - 1].$result;
    }

    return $result;
}

?>
