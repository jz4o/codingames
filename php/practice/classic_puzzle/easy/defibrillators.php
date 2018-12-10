<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%s",
    $LON
);
$LON = floatval(str_replace(',', '.', $LON));
fscanf(STDIN, "%s",
    $LAT
);
$LAT = floatval(str_replace(',', '.', $LAT));
fscanf(STDIN, "%d",
    $N
);
$defibs = array();
for ($i = 0; $i < $N; $i++)
{
    $DEFIB = stream_get_line(STDIN, 256 + 1, "\n");
    $tmp = explode(';', $DEFIB);

    $defib = array();
    $defib['id']        = $tmp[0];
    $defib['name']      = $tmp[1];
    $defib['address']   = $tmp[2];
    $defib['phone']     = $tmp[3];
    $defib['longitude'] = floatval(str_replace(',', '.', $tmp[4]));
    $defib['latitude']  = floatval(str_replace(',', '.', $tmp[5]));

    array_push($defibs, $defib);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$near_defib = $defibs[0];
$near_distance = 10000;
foreach ($defibs as $defib) {
    $x = ($LON - $defib['longitude']) * cos(($defib['latitude'] + $LAT) / 2);
    $y = $LAT - $defib['latitude'];
    $d = sqrt($x*$x + $y*$y) * 6371;

    if ($d < $near_distance) {
        $near_distance = $d;
        $near_defib = $defib;
    }
}

// echo("answer\n");
echo $near_defib['name'];

?>
