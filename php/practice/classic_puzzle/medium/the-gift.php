<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
fscanf(STDIN, "%d",
    $C
);
$budgets = array();
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%d",
        $B
    );
    array_push($budgets, $B);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$results = array();
if (array_sum($budgets) < $C) {
    array_push($results, 'IMPOSSIBLE');
} else {
    $lack = $C;
    sort($budgets);
    for ($i = 0; $i < count($budgets); $i++) {
        $average = intval($lack / (count($budgets) - $i));
        $pay = min($budgets[$i], $average);
        $lack -= $pay;
        array_push($results, $pay);
    }
}

// echo("IMPOSSIBLE\n");
foreach ($results as $result) {
    echo $result."\n";
}

?>
