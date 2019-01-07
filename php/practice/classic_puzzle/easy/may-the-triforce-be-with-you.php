<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$WIDTH = $N * 4 - 1;

$upper_parts = array();
$lower_parts = array();

for ($i=1; $i<=$N; $i++) {
    $part = str_repeat('*', $i * 2 - 1);

    $upper_part = rtrim(str_pad($part, $WIDTH, ' ', STR_PAD_BOTH));
    array_push($upper_parts, $upper_part);

    $space_part = str_repeat(' ', ($N - $i + 1) * 2 - 1);
    $lower_part = rtrim(str_pad($part.$space_part.$part, $WIDTH, ' ', STR_PAD_BOTH));
    array_push($lower_parts, $lower_part);
}
$upper_parts[0] = '.'.substr($upper_parts[0], 1);

// echo("answer\n");

foreach (array_merge($upper_parts, $lower_parts) as $part) {
    echo $part."\n";
}

?>
