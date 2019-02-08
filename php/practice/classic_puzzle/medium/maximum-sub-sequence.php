<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$inputs = fgets(STDIN);
$inputs = explode(" ",$inputs);
for ($i = 0; $i < $N; $i++)
{
    $l = intval($inputs[$i]);
    $inputs[$i] = $l;
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$lists = array();
foreach ($inputs as $i) {
    foreach ($lists as $index => $list) {
        $last_int = $list[count($list) - 1];
        if (count($list) >= 1 && $last_int === $i - 1) {
            array_push($lists[$index], $i);
        }
    }
    array_push($lists, array($i));
}

$max_size = 0;
$result = array();
foreach ($lists as $list) {
    if (count($list) >= $max_size) {
        $max_size = count($list);
        $result = $list;
    }
}

// echo("1 2 3 4 5\n");
echo implode(" ", $result);

?>
