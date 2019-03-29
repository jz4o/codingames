<?php
/**
 * Don't let the machines win. You are humanity's last hope...
 **/

fscanf(STDIN, "%d",
    $width // the number of cells on the X axis
);
fscanf(STDIN, "%d",
    $height // the number of cells on the Y axis
);

$grid = array_fill(0, $height, array());
for ($i = 0; $i < $height; $i++)
{
    $line = stream_get_line(STDIN, 31 + 1, "\n"); // width characters, each either 0 or .
    $grid[$i] = str_split($line);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$results = array();
for ($h = 0; $h < $height; $h++) {
    for ($w = 0; $w < $width; $w++) {
        if ($grid[$h][$w] === '.') {
            continue;
        }

        $result = array();
        array_push($result, $w.' '.$h);

        // check right
        for ($r = $w + 1; $r <= $width; $r++) {
            if ($r >= $width) {
                array_push($result, '-1 -1');
                break;
            } else if ($grid[$h][$r] === '0') {
                array_push($result, $r.' '.$h);
                break;
            } else {
                continue;
            }
        }

        // check bottom
        for ($b = $h + 1; $b <= $height; $b++) {
            if ($b >= $height) {
                array_push($result, '-1 -1');
                break;
            } else if ($grid[$b][$w] === '0') {
                array_push($result, $w.' '.$b);
                break;
            } else {
                continue;
            }
        }

        array_push($results, implode(' ', $result));
    }
}

// Three coordinates: a node, its right neighbor, its bottom neighbor
// echo("0 0 1 0 0 1\n");
foreach ($results as $key => $value) {
    echo $value."\n";
}

?>
