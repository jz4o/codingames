<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d %d %d", $w, $h, $countX, $countY);
$inputs = explode(" ", fgets(STDIN));
$width_measurements = [0];
for ($i = 0; $i < $countX; $i++)
{
    $x = intval($inputs[$i]);

    array_push($width_measurements, $x);
}
array_push($width_measurements, $w);
$inputs = explode(" ", fgets(STDIN));
$height_measurements = [0];
for ($i = 0; $i < $countY; $i++)
{
    $y = intval($inputs[$i]);

    array_push($height_measurements, $y);
}
array_push($height_measurements, $h);

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

$width_counts = [];
for ($index = 0; $index < count($width_measurements); $index++) {
    $width_measurement = $width_measurements[$index];

    for ($i = 0; $i < $index; $i++) {
        $width = $width_measurement - $width_measurements[$i];
        $width_counts[$width] = (array_key_exists($width, $width_counts) ? $width_counts[$width] : 0) + 1;
    }
}

$height_counts = [];
for ($index = 0; $index < count($height_measurements); $index++) {
    $height_measurement = $height_measurements[$index];

    for ($i = 0; $i < $index; $i++) {
        $height = $height_measurement - $height_measurements[$i];
        $height_counts[$height] = (array_key_exists($height, $height_counts) ? $height_counts[$height] : 0) + 1;
    }
}

$result = 0;
foreach (array_keys($width_counts) as $k) {
    $result += $width_counts[$k] * (array_key_exists($k, $height_counts) ? $height_counts[$k] : 0);
}

// echo("0\n");
echo "$result";

?>
