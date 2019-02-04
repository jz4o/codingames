<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $W,
    $H
);
$elements_size = intval(($W / 3 + 1) * 2);
$map = array();
for ($i = 0; $i < $H; $i++)
{
    $line = stream_get_line(STDIN, 1024 + 1, "\n");
    $line = "  ".$line;

    $map_line = array();

    for ($j = 0; $j < $elements_size / 2; $j++) {
        // column between vertival bars
        $map_line[$j * 2] = $line[$j * 3];

        // column vertical bar
        $map_line[$j * 2 + 1] = $line[$j * 3 + 2];
    }
    array_push($map, $map_line);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$top = $map[0];
$bottom = $map[count($map) - 1];

for ($i = count($map) - 2; $i > 0; $i--) {
    for ($j = 0; $j < $elements_size; $j++) {
        if ($map[$i][$j] === "-") {
            $tmp = $bottom[$j - 1];
            $bottom[$j - 1] = $bottom[$j + 1];
            $bottom[$j + 1] = $tmp;
        }
    }
}

// echo("answer\n");
// 1 += 2 is because skip horizontal bar columns
for ($i = 1; $i < $elements_size; $i += 2) {
    echo($top[$i].$bottom[$i]."\n");
}

?>
