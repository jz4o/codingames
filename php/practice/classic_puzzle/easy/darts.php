<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $SIZE
);
fscanf(STDIN, "%d",
    $N
);
$names = array();
for ($i = 0; $i < $N; $i++)
{
    $name = stream_get_line(STDIN, 100 + 1, "\n");
    array_push($names, $name);
}
fscanf(STDIN, "%d",
    $T
);
$throw_datas = array();
for ($i = 0; $i < $T; $i++)
{
    $throwData = stream_get_line(STDIN, 100 + 1, "\n");
    array_push($throw_datas, $throwData);
}

$HALF_SIZE = $SIZE / 2;
$score_board = array();
foreach ($names as $name) {
    $score_board[$name] = 0;
}

// score culclation
foreach ($throw_datas as $throw_data) {
    list($name, $x, $y) = explode(' ', $throw_data);
    list($x, $y) = array(intval($x), intval($y));

    $distance_with_center = sqrt($x ** 2 + $y ** 2);
    $distance_with_edge   = sqrt(($HALF_SIZE - abs($x)) ** 2 + ($HALF_SIZE - abs($y)) ** 2);

    $in_square_horizontal = in_array($x, range(-$HALF_SIZE, $HALF_SIZE));
    $in_square_vertical   = in_array($y, range(-$HALF_SIZE, $HALF_SIZE));

    $in_square  = $in_square_horizontal && $in_square_vertical;
    $in_circle  = $distance_with_center <= $HALF_SIZE;
    $in_diamond = $distance_with_center <= $distance_with_edge;

    if ($in_diamond) {
        $score_board[$name] += 15;
    } else if ($in_circle) {
        $score_board[$name] += 10;
    } else if ($in_square) {
        $score_board[$name] += 5;
    }
}

// score sorting
$name_indexes = array();
$scores = array();
foreach ($score_board as $name => $score) {
    array_push($name_indexes, array_search($name, $names));
    array_push($scores, $score);
}
array_multisort($scores, SORT_DESC, $name_indexes, SORT_ASC, $score_board);

// printing for score
foreach ($score_board as $name => $score) {
    echo $name.' '.$score."\n";
}

?>
