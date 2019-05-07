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

$stage = 0;
while ($N >= $stage + 1) {
    $N -= ++$stage;
}

$GLASS_PARTS = array(
    ' *** ',
    ' * * ',
    ' * * ',
    '*****'
);
$WIDTH = $stage * strlen($GLASS_PARTS[0]) + $stage - 1;

$results = array();
for ($step = 1; $step <= $stage; $step++) {
    foreach ($GLASS_PARTS as $glass_part) {
        $result = implode(" ", array_fill(0, $step, $glass_part));
        $result = str_pad($result, $WIDTH, " ", STR_PAD_BOTH);

        array_push($results, $result);
    }
}

// echo("answer\n");
echo implode("\n", $results);

?>
