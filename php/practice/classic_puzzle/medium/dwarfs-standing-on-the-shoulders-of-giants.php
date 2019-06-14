<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n // the number of relationships of influence
);
$relation_map = array();
for ($i = 0; $i < $n; $i++)
{
    fscanf(STDIN, "%d %d",
        $x, // a relationship of influence between two people (x influences y)
        $y
    );

    if (!isset($relation_map[$x])) {
        $relation_map[$x] = array();
    }

    array_push($relation_map[$x], $y);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$deep_level = 0;
$targets = array_keys($relation_map);
while (!empty($targets)) {
    $deep_level++;
    $temp = array();
    foreach ($targets as $key) {
        if (!isset($relation_map[$key])) {
            continue;
        }

        foreach ($relation_map[$key] as $value) {
            array_push($temp, $value);
        }
    }

    $targets = $temp;
}

// The number of people involved in the longest succession of influences
// echo("2\n");
echo $deep_level;

?>
