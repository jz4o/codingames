<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$lhs = stream_get_line(STDIN, 10 + 1, "\n");
$op = stream_get_line(STDIN, 5 + 1, "\n");
$rhs = stream_get_line(STDIN, 10 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$lhs = balance_to_decimal($lhs);
$rhs = balance_to_decimal($rhs);
if (strpos($op, '<<') !== false || strpos($op, '>>') !== false) {
    $rhs = pow(3, $rhs);
}

$result;
switch($op) {
    case '+':
        $result = $lhs + $rhs;
        break;
    case '-':
        $result = $lhs - $rhs;
        break;
    case '*':
    case '<<':
        $result = $lhs * $rhs;
        break;
    case '>>':
        $result = $lhs / $rhs;
        break;
}

// echo("11T\n");
echo decimal_to_balance($result);


function balance_to_decimal($balance) {
    $result = 0;

    $chars = array_reverse(str_split($balance));
    for ($i = 0; $i < count($chars); $i++) {
        $char = $chars[$i];
        $result += ($char === 'T' ? -1 : intval($char)) * pow(3, $i);
    }

    return $result;
}

function decimal_to_balance($decimal) {
    $result = '';
    while ($decimal !== 0) {
        $mod = $decimal % 3;
        $decimal = intval($decimal / 3);

        if ($mod === 2) {
            $decimal++;
            $result = 'T'.$result;
        } else {
            $result = $mod.$result;
        }
    }

    return empty($result) ? '0' : $result;
}

?>
