<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $r1
);
fscanf(STDIN, "%d",
    $r2
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$rivers = [$r1, $r2];
while($r1 != $r2) {
    $target = $r1 < $r2 ? 'r1' : 'r2';
    preg_match_all("/./", $$target, $digits);
    $$target += array_sum($digits[0]);
}

// echo("42\n");
echo $r1;

?>
