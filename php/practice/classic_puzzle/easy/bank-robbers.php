<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $R
);
fscanf(STDIN, "%d",
    $V
);

$robbers = [];
for($i=0; $i<$R; $i++) {
    $robbers[] = 0;
}

for ($i = 0; $i < $V; $i++)
{
    fscanf(STDIN, "%d %d",
        $C,
        $N
    );
    $vault_time = ( 10 ** $N ) * ( 5 ** ( $C - $N ) );
    $robbers[array_search(min($robbers), $robbers)] += $vault_time;
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

// echo("1\n");
echo max($robbers);

?>
