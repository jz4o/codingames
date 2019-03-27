<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n
);
$all_sum = 0;
$grid = array_fill(0, $n, array());
for ($i = 0; $i < $n; $i++)
{
    $inputs = fgets(STDIN);
    $inputs = explode(" ",$inputs);
    for ($j = 0; $j < $n; $j++)
    {
        $c = intval($inputs[$j]);

        $grid[$i][$j] = $c;
        $all_sum += $c;
    }
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$max_int_in_grid = pow($n, 2);
$expect_sum = array_sum(range(1, $max_int_in_grid));
$is_check_all_sum = $all_sum == $expect_sum;
$is_check_sums = is_equals_each_line_sums($grid);

// echo("answer\n");
echo $is_check_all_sum && $is_check_sums ? 'MAGIC' : 'MUGGLE';

function is_equals_each_line_sums($array) {
    $result = true;
    $size = count($array);

    // counter
    $line_sums   = array_fill(0, $size, 0);
    $column_sums = array_fill(0, $size, 0);
    $left_top_to_right_bottom_sum = 0;
    $left_bottom_to_right_top_sum = 0;

    // count
    for ($h = 0; $h < $size; $h++) {
        for ($w = 0; $w < $size; $w++) {
            $value = $array[$h][$w];

            $line_sums[$h] += $value;
            $column_sums[$w] += $value;
            if ($h == $w) { $left_top_to_right_bottom_sum += $value; }
            if ($h + $w + 1 == $size) { $left_bottom_to_right_top_sum += $value; }
        }
    }

    // check
    $result &= $left_top_to_right_bottom_sum == $left_bottom_to_right_top_sum;
    for ($i = 0; $i < $size; $i++) {
        $result &= $left_top_to_right_bottom_sum == $line_sums[$i];
        $result &= $left_top_to_right_bottom_sum == $column_sums[$i];
    }

    return $result;
}

?>
