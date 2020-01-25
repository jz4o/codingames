<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$is_carmichael = !is_prime($n);
foreach (prime_division($n) as $prime_factor) {
    if (($n - 1) % ($prime_factor - 1) !== 0) {
        $is_carmichael = false;
        break;
    }
}

// echo("YES|NO\n");
echo($is_carmichael ? "YES" : "NO");


function prime_division($num) {
    $list = array();

    while ($num % 2 === 0) {
        array_push($list, 2);
        $num /= 2;
    }

    $i = 3;
    while ($num !== 1) {
        if ($num % $i === 0) {
            array_push($list, $i);
            $num /= $i;
        } else {
            $i += 2;
        }
    }

    return $list;
}

function is_prime($num) {
    for ($i = 2; $i < $num; $i++) {
        if ($num % $i === 0) {
            return false;
        }
    }

    return true;
}

?>
