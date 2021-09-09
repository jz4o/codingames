<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $N);
$grid = [];
for ($i = 0; $i < $N; $i++)
{
    $line = stream_get_line(STDIN, 256 + 1, "\n");

    array_push($grid, str_split($line.' '));
}

$width = max(array_map(function($row) { return count($row); }, $grid)) + 2;

foreach (range(0, count($grid) - 1) as $i) {
    while (count($grid[$i]) < $width) {
        array_push($grid[$i], ' ');
    }
}
array_push($grid, array_fill(0, $width, ' '));
array_push($grid, array_fill(0, $width, ' '));

foreach (range($N + 1, 0) as $row_index) {
    foreach (range($width - 1, 0) as $column_index) {
        if ($grid[$row_index][$column_index] !== ' ') {
            continue;
        }

        if ($row_index >= 2 && $column_index >= 2 && $grid[$row_index - 2][$column_index - 2] !== ' ') {
            $grid[$row_index][$column_index] = '`';
        }

        if ($row_index >= 1 && $column_index >= 1 && $grid[$row_index - 1][$column_index - 1] !== ' ') {
            $grid[$row_index][$column_index] = '-';
        }
    }
}

foreach ($grid as $row) {
    echo rtrim(implode('', $row))."\n";
}

?>
