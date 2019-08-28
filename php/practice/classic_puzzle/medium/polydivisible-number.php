<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$NUMBER = stream_get_line(STDIN, 100 + 1, "\n");
$numbers = array();
foreach (explode(" ", $NUMBER) as $number) {
    array_push($numbers, intval($number));
}

$nbanswer = 36;
for ($base = 0; $base <= $nbanswer; $base++)
{

    // Write an action using echo(). DON'T FORGET THE TRAILING \n
    // To debug (equivalent to var_dump): error_log(var_export($var, true));

    if ($base <= max($numbers)) {
        continue;
    }
    $base_number = "";
    foreach ($numbers as $number) {
        $base_number .= decimal_to_n_base_number($number, $base);
    }
    $decimal_number = n_base_number_to_decimal($base_number, $base);
    for ($i = 1; $i <= strlen($decimal_number); $i++) {
        if (intval(bcmod(substr($decimal_number, 0, $i), strval($i))) !== 0) {
            continue 2;
        }
    }

    // echo("value\n");
    echo $base."\n";
}


function decimal_to_n_base_number($number, $base) {
    $base_numbers = array_merge(range('0', '9'), range('a', 'z'));

    $result = '';
    do {
        $m = bcmod(strval($number), strval($base));
        $number = intval(bcdiv(strval($number), strval($base)));

        $result = $base_numbers[$m].$result;
    } while ($number > 0);

    return $result;
}

function n_base_number_to_decimal($number, $base) {
    $base_numbers = array_merge(range('0', '9'), range('a', 'z'));

    $result = 0;
    for ($i = 0; $i < strlen($number); $i++) {
        $d = substr($number, ($i + 1) * -1, 1);
        $digit = array_search($d, $base_numbers, true);
        if ($digit === false) {
            $digit = intval($d);
        }

        $result = bcadd($result, bcmul(strval($digit), bcpow(strval($base), strval($i))));
    }

    return $result;
}

?>
