<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $a,
    $b
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$high = max($a, $b);
$low  = min($a, $b);

$results = array();

// initial formula
array_push($results, $high.' * '.$low);

$add_num_formula = '';
while ($low !== 0) {
    if ($low % 2 === 0) {
        $high *= 2;
        $low  /= 2;
    } else {
        $add_num_formula .= ' + '.$high;
        $low--;
    }

    // way formula
    array_push($results, '= '.$high.' * '.$low.$add_num_formula);
}

// answer
array_push($results, '= '.($a * $b));

// echo("answer\n");
foreach ($results as $result) {
    echo $result."\n";
}

?>
