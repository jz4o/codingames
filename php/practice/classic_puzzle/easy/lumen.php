<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $N);
fscanf(STDIN, "%d", $L);

define('LIGHT_SPOT', 'O');
define('DARK_SPOT', 'X');

$padding_row = array_fill(0, $L * 2 + $N, LIGHT_SPOT);
$padding_column = array_fill(0, $L, LIGHT_SPOT);

$grid = [];
for ($i = 0; $i < $L; $i++) {
    array_push($grid, $padding_row);
}
for ($i = 0; $i < $N; $i++)
{
    $inputs = explode(" ", rtrim(fgets(STDIN)));
    for ($j = 0; $j < $N; $j++)
    {
        $cell = ($inputs[$j]);
    }

    array_push($grid, array_merge($padding_column, $inputs, $padding_column));
}
for ($i = 0; $i < $L; $i++) {
    array_push($grid, $padding_row);
}

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

$c_indexes = [];
foreach ($grid as $row_index => $row) {
    foreach ($row as $column_index => $column) {
        if ($column === 'C') {
            array_push($c_indexes, ['row_index' => $row_index, 'column_index' => $column_index]);
        }
    }
}

foreach ($c_indexes as $indexes) {
    $row_index = $indexes['row_index'];
    $column_index = $indexes['column_index'];

    foreach (range($row_index - $L + 1, $row_index + $L - 1) as $c_row_index) {
        foreach (range($column_index - $L + 1, $column_index + $L - 1) as $index) {
            $grid[$c_row_index][$index] = LIGHT_SPOT;
        }
    }
}

$count_values = array_count_values(array_flatten($grid));
$result = array_key_exists(DARK_SPOT, $count_values) ? $count_values[DARK_SPOT] : 0;

// echo("2\n");
echo($result);

function array_flatten($array) {
    $result = [];
    array_walk_recursive($array, function($elm)use(&$result) { $result[] = $elm; });

    return $result;
}

?>
