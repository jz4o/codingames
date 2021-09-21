<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d", $w, $h);
$pixels = [];
for ($i = 0; $i < $h; $i++)
{
    $inputs = explode(" ", fgets(STDIN));
    for ($j = 0; $j < $w; $j++)
    {
        $pixel = intval($inputs[$j]);

        array_push($pixels, $pixel);
    }
}

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

$bits = implode('', array_map(function($pixel) { return $pixel % 2; }, $pixels));
$eight_bits = str_split($bits, 8);
$decimals = array_map(function($b) { return bindec($b); }, $eight_bits);
$chars = array_map(function($decimal) { return chr($decimal); }, $decimals);
$result = implode('', $chars);

// echo("answer\n");
echo($result."\n");

?>
