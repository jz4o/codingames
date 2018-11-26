<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$pis = [];
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%d",
        $Pi
    );
    array_push($pis, $Pi);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));
$diff = 10000000 - 0;
sort($pis);
for ($i = 0; $i < $N - 1; $i++) {
    $d = $pis[$i + 1] - $pis[$i];
    if ($d < $diff) {
        $diff = $d;
    }
}

// echo("answer\n");

echo($diff."\n");

?>
