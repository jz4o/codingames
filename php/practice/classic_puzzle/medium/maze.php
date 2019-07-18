<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $W,
    $H
);
fscanf(STDIN, "%d %d",
    $X,
    $Y
);
$map = array();
array_push($map, array_fill(0, $W + 2, null));
for ($i = 0; $i < $H; $i++)
{
    $R = stream_get_line(STDIN, 24 + 1, "\n");
    $row = array_merge(array(null), str_split($R), array(null));
    array_push($map, $row);
}
array_push($map, array_fill(0, $W + 2, null));

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$checked_maths  = array();
$be_check_maths = array(array($Y + 1, $X + 1));
$exit_maths     = array();

while (count($be_check_maths) > 0) {
    $check_math = array_pop($be_check_maths);
    $y = $check_math[0];
    $x = $check_math[1];

    if (array_search(array($y, $x), $checked_maths) !== false) {
        continue;
    }

    array_push($checked_maths, array($y, $x));

    $near_maths = array(
        array($y, $x - 1),
        array($y - 1, $x),
        array($y, $x + 1),
        array($y + 1, $x)
    );

    foreach ($near_maths as $near_math) {
        $ny = $near_math[0];
        $nx = $near_math[1];
        $math = $map[$ny][$nx];
        if ($math === '.') {
            array_push($be_check_maths, array($ny, $nx));
        } else if ($math === null) {
            array_push($exit_maths, array($x - 1, $y - 1));
        }
    }
}

// echo("answer\n");
sort($exit_maths);
echo count($exit_maths)."\n";
foreach ($exit_maths as $exit_math) {
    echo implode(' ', $exit_math)."\n";
}

?>
