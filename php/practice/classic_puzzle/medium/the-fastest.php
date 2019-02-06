<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$results = array();
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%s",
        $t
    );
    array_push($results, $t);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

sort($results);

// echo("answer\n");
echo($results[0]);

?>
