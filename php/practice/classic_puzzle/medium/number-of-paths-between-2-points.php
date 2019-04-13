<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $M
);
fscanf(STDIN, "%d",
    $N
);

$grid = array_fill(0, $M + 1, array());

// // initialize wall row and column.
$grid[0] = array_fill(0, $N + 1, 1);
for ($i = 1; $i <= $M; $i++) { $grid[$i][0] = 1; }

// initialize map.
for ($i = 0; $i < $M; $i++)
{
    $ROW = stream_get_line(STDIN, 100 + 1, "\n");
    $values = str_split($ROW);

    for ($j = 0; $j < count($values); $j++) {
        $grid[$i + 1][$j + 1] = intval($values[$j]);
    }
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$path_grid = array_fill(0, $M + 1, array());

// // only one route of start position. and put wall for don't process start position
$grid[1][1] = $path_grid[1][1] = 1;
for ($row_index = 1; $row_index <= $M; $row_index++) {
    for ($column_index = 1; $column_index <= $N; $column_index++) {
        if ($grid[$row_index][$column_index] !== 0) {
            continue;
        }

        $top_cell_paths = $path_grid[$row_index - 1][$column_index] ?? 0;
        $left_cell_paths = $path_grid[$row_index][$column_index - 1] ?? 0;
        $path_grid[$row_index][$column_index] = $top_cell_paths + $left_cell_paths;
    }
}

// echo("answer\n");
echo $path_grid[$M][$N];

?>
