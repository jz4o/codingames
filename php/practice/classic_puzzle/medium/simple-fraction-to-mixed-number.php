<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$xYs = array();
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%s",
        $xY
    );
    array_push($xYs, $xY);
}
for ($i = 0; $i < $N; $i++)
{

    // Write an action using echo(). DON'T FORGET THE TRAILING \n
    // To debug (equivalent to var_dump): error_log(var_export($var, true));

    list($x, $y) = explode("/", $xYs[$i]);
    $x = intval($x);
    $y = intval($y);

    if ($y === 0) {
        echo "DIVISION BY ZERO\n";
        continue;
    }

    $int = intval($x / $y);
    $x %= $y;

    $intStr = '';
    if ($int !== 0) {
        $intStr .= $int;
    }

    $rationalStr = '';
    if ($x !== 0) {
        $gcd = gcd($x, $y);
        $x /= $gcd;
        $y /= $gcd;

        $minusFlg = $int < 0;
        if ($x < 0) { $minusFlg = !$minusFlg; $x = -$x; }
        if ($y < 0) { $minusFlg = !$minusFlg; $y = -$y; }
        $rationalStr .= $minusFlg ? '-' : '';
        $rationalStr .= $x.'/'.$y;
    }

    $result = trim($intStr.' '.$rationalStr);

    // echo("answer\n");
    echo (strlen($result) == 0 ? '0' : $result)."\n";
}

function gcd($x, $y) {
    $tmp;
    while (($tmp = $x % $y) !== 0) {
        $x = $y;
        $y = $tmp;
    }

    return $y;
}

?>
