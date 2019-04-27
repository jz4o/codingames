<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$inputs = fgets(STDIN);
$inputs = explode(" ",$inputs);
$stone_counts = array();
for ($i = 0; $i < $N; $i++)
{
    $level = intval($inputs[$i]);
    if (!isset($stone_counts[$level])) {
        $stone_counts[$level] = 0;
    }

    $stone_counts[$level]++;
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$stone_count = 0;
while (count($stone_counts) > 0) {
    // minimum level in stoneCounts
    $target_level         = min(array_keys($stone_counts));
    $target_next_level     = $target_level + 1;
    $target_stone_count    = $stone_counts[$target_level];
    $next_level_stone_count = intval($target_stone_count / 2);
    $target_stone_count    = $target_stone_count % 2;

    $stone_count += $target_stone_count;
    unset($stone_counts[$target_level]);

    if ($next_level_stone_count !== 0) {
        if (!isset($stone_counts[$target_next_level])) {
            $stone_counts[$target_next_level] = 0;
        }

        $stone_counts[$target_next_level] += $next_level_stone_count;
    }
}

// echo("1\n");
echo $stone_count;

?>
