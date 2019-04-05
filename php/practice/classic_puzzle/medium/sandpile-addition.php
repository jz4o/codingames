<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n
);

$grid = array_fill(0, $n, array());
for($i = 0; $i < $n; $i++) {
    $grid[$i] = array_fill(0, $n, 0);
}

for ($i = 0; $i < $n; $i++)
{
    $row = stream_get_line(STDIN, 12 + 1, "\n");
    $values = str_split($row);
    for ($j = 0; $j < $n; $j++) {
        $grid[$i][$j] += intval($values[$j]);
    }
}
for ($i = 0; $i < $n; $i++)
{
    $row = stream_get_line(STDIN, 12 + 1, "\n");
    $values = str_split($row);
    for ($j = 0; $j < $n; $j++) {
        $grid[$i][$j] += intval($values[$j]);
    }
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$border = 4;
$check_count = 0;
$mass_count = intval(pow($n, 2));

while ($check_count < $mass_count) {
    for ($row_index = 0; $row_index < $n; $row_index++) {
        for ($column_index = 0; $column_index < $n; $column_index++) {
            if ($grid[$row_index][$column_index] < $border) {
                $check_count++;
                continue;
            }

            $check_count = 0;
            $grid[$row_index][$column_index] -= $border;
            if ($row_index > 0)         { $grid[$row_index - 1][$column_index]++; }
            if ($row_index < $n - 1)    { $grid[$row_index + 1][$column_index]++; }
            if ($column_index > 0)      { $grid[$row_index][$column_index - 1]++; }
            if ($column_index < $n - 1) { $grid[$row_index][$column_index + 1]++; }
        }
    }
}

// echo("answer\n");
foreach($grid as $line) {
    foreach ($line as $value) {
        echo $value;
    }
    echo "\n";
}

?>
