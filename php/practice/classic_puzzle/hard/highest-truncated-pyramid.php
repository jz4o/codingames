<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);

$part_count = $top_step_count = $bottom_step_count = 1;

while (true) {
    if ($part_count < $N) {
        $bottom_step_count++;
        $part_count += $bottom_step_count;
    } else if ($N < $part_count) {
        $part_count -= $top_step_count;
        $top_step_count++;
    } else {
        break;
    }
}

foreach (range($top_step_count, $bottom_step_count) as $step_count) {
    echo str_repeat('*', $step_count)."\n";
}

?>
