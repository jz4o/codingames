<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
fscanf(STDIN, "%d",
    $X
);
$grid = array_fill(0, $N, array());
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%s",
        $LINE
    );
    $grid[$i] = str_split($LINE);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

// array to string
$chars = "";
$grid = transpose($grid);
for ($i = 0; $i < $N; $i++) {
    if ($i % 2 === 0) {
        $grid[$i] = array_reverse($grid[$i]);
    }
    $chars .= implode('', $grid[$i]);
}

// rotate
$chars_length = strlen($chars);
$rotate_begin_index = $chars_length - $X;
$chars = mb_substr($chars.$chars, $rotate_begin_index, $chars_length);

// string to array
preg_match_all("/.{".$N."}/", $chars, $matched_elements);
$matched_elements = $matched_elements[0];
for ($i = 0; $i < $N; $i++) {
    $matched_element = str_split($matched_elements[$i]);
    if ($i % 2 === 0) {
        $matched_element = array_reverse($matched_element);
    }

    $grid[$i] = $matched_element;
}
$grid = transpose($grid);

// echo("answer\n");
foreach ($grid as $line) {
    echo implode('', $line)."\n";
}

/**
 * example.
 *
 * input
 *
 *    1  2  3  4  5
 *    6  7  8  9 10
 *   11 12 13 14 15
 *
 * output
 *
 *   1  6 11
 *   2  7 12
 *   3  8 13
 *   4  9 14
 *   5 10 15
 */
function transpose($array) {
    $array_row_size = count($array);
    $array_column_size = count($array[0]);
    $result = array_fill(
        0,
        $array_column_size,
        array_fill(0, $array_row_size, array())
    );

    for ($row_index = 0; $row_index < $array_row_size; $row_index++) {
        for ($column_index = 0; $column_index < $array_column_size; $column_index++) {
            $result[$column_index][$row_index] = $array[$row_index][$column_index];
        }
    }

    return $result;
}

?>
