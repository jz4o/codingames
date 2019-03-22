<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $width,
    $height
);
$grid = array();
for ($i = 0; $i < $height; $i++)
{
    fscanf(STDIN, "%s",
        $line
    );
    array_push($grid, str_split($line));
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

// count for sharp on each columns
$sharp_count = array_pad(array(), $width, 0);
for ($h = 0; $h < $height; $h++) {
    for ($w = 0; $w < $width; $w++) {
        if ($grid[$h][$w] == '#') {
            $sharp_count[$w]++;
        }
    }
}

// fall by gravity
for ($h = 0; $h < $height; $h++) {
    for ($w = 0; $w < $width; $w++) {
        $grid[$h][$w] = $h < $height - $sharp_count[$w] ? '.' : '#';
    }
}

// echo("answer\n");
foreach ($grid as $line) {
    echo implode('', $line)."\n";
}

?>
