<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $W
);
fscanf(STDIN, "%d",
    $H
);
$grid = array();
for ($i = 0; $i < $H; $i++)
{
    $ROW = stream_get_line(STDIN, $W + 1, "\n");
    array_push($grid, str_split($ROW));
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$max_score = 0;
for ($row_index = 0; $row_index < $H - 1; $row_index++) {
    for ($column_index = 0; $column_index < $W - 1; $column_index++) {
        // check block can placed?
        if ($grid[$row_index][$column_index] === '#' ||
            $grid[$row_index][$column_index + 1] === '#' ||
            $grid[$row_index + 1][$column_index] === '#' ||
            $grid[$row_index + 1][$column_index + 1] === '#') {
            continue;
        }

        // grid with block placed.
        $clone_grid = $grid;
        $clone_grid[$row_index][$column_index]         = '#';
        $clone_grid[$row_index][$column_index + 1]     = '#';
        $clone_grid[$row_index + 1][$column_index]     = '#';
        $clone_grid[$row_index + 1][$column_index + 1] = '#';

        // count columns and rows that could be completed.
        $score = get_completed_row_or_column_count($clone_grid);
        if ($score > $max_score) {
            $max_score = $score;
        }
    }
}

// echo("answer\n");
echo $max_score;

function get_completed_row_or_column_count($grid) {
    $height = count($grid);
    $width  = count($grid[0]);
    $count = 0;

    // horizontal
    for ($row_index = 0; $row_index < $height; $row_index++) {
        for ($column_index = 0; $column_index < $width; $column_index++) {
            if ($grid[$row_index][$column_index] === '.') {
                continue 2;
            }
        }
        $count++;
    }

    // vertical
    for ($column_index = 0; $column_index < $width; $column_index++) {
        for ($row_index = 0; $row_index < $height; $row_index++) {
            if ($grid[$row_index][$column_index] === '.') {
                continue 2;
            }
        }
        $count++;
    }

    return $count;
}

?>
