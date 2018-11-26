<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $r1
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$is_success = false;
for ( $i=$r1-1; $i>0; $i-- ) {
    preg_match_all('/./', $i, $digits);
    if ( $i + array_sum($digits[0]) == $r1) {
        $is_success = true;
        break;
    }
}

// echo("YES|NO\n");
echo $is_success ? 'YES' : 'NO'

?>
