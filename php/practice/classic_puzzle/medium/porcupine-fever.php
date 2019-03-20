<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
fscanf(STDIN, "%d",
    $Y
);
$cages = array();
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%d %d %d",
        $S,
        $H,
        $A
    );
    array_push($cages, array($S, $H, $A));
}

define('SICK',     0);
define('SURVIVAL', 2);

for ($i = 0; $i < $Y; $i++) {
    $alive = 0;
    for ($c = 0; $c < count($cages); $c++) {
        $sick = $cages[$c][SICK] * pow(2, $i);
        $survival = $cages[$c][SURVIVAL] -= $sick;
        $alive += max($survival, 0);
    }

    echo $alive."\n";

    if ($alive <= 0) {
        break;
    }
}

?>
