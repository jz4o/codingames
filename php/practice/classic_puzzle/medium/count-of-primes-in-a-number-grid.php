<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $R,
    $C
);
$grid = array();
for ($i = 0; $i < $R; $i++)
{
    $row = stream_get_line(STDIN, 128 + 1, "\n");
    array_push($grid, explode(" ", $row));
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$combination_numbers = array();
$long_side = max($R, $C);
for ($target_index = 0; $target_index < $long_side; $target_index++) {
    for ($get_count = 1; $get_count <= $long_side; $get_count++) {
        for ($begin_index = 0; $begin_index < $long_side; $begin_index++) {
            $end_index = $begin_index + $get_count - 1;

            $can_get_horizontal_combination = $target_index < $R && $end_index < $C;
            $can_get_vertical_combination   = $target_index < $C && $end_index < $R;

            $horizontal_combination_number = '0';
            $vertical_combination_number   = '0';

            for ($add_index = $begin_index; $add_index <= $end_index; $add_index++) {
                if ($can_get_horizontal_combination) {
                    $horizontal_combination_number .= $grid[$target_index][$add_index];
                }
                if ($can_get_vertical_combination) {
                    $vertical_combination_number .= $grid[$add_index][$target_index];
                }
            }

            $combination_numbers[intval($horizontal_combination_number)] = null;
            $combination_numbers[intval($vertical_combination_number)]   = null;
        }
    }
}

$result = 0;
foreach (array_keys($combination_numbers) as $key) {
    if (is_prime($key)) {
        $result++;
    }
}

// echo("answer\n");
echo $result;

function is_prime($num) {
    if ($num < 2) {
        return false;
    }

    for ($i = 2; $i < $num; $i++) {
        if ($num % $i === 0) {
            return false;
        }
    }

    return true;
}

?>
