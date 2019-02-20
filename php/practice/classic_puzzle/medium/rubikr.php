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

$cube_count = pow($N, 3);
$invisible_cube_count = pow(max($N - 2, 0), 3);

// echo("answer\n");
echo $cube_count - $invisible_cube_count;

?>
