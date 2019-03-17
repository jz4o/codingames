<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$words = array();
for ($i = 0; $i < $N; $i++)
{
    $W = stream_get_line(STDIN, 30 + 1, "\n");
    $words[$i] = $W;
}
$LETTERS = stream_get_line(STDIN, 7 + 1, "\n");

$points = array(
    'e' => 1,
    'a' => 1,
    'i' => 1,
    'o' => 1,
    'n' => 1,
    'r' => 1,
    't' => 1,
    'l' => 1,
    's' => 1,
    'u' => 1,
    'd' => 2,
    'g' => 2,
    'b' => 3,
    'c' => 3,
    'm' => 3,
    'p' => 3,
    'f' => 4,
    'h' => 4,
    'v' => 4,
    'w' => 4,
    'y' => 4,
    'k' => 5,
    'j' => 8,
    'x' => 8,
    'q' => 10,
    'z' => 10
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$best_word = '';
$max_point = 0;
foreach ($words as $word) {
    $made_flg = true;
    $point = 0;
    $can_chars = $LETTERS;

    foreach (str_split($word) as $w) {
        $w_index = strpos($can_chars, $w);
        if ($w_index === false) {
            $made_flg = false;
            $point = 0;
            break;
        }

        $point += $points[$w];

        $left_part = substr($can_chars, 0, $w_index);
        $right_part = substr($can_chars, $w_index + 1);
        $can_chars = $left_part.$right_part;
    }

    if ($made_flg && $max_point < $point) {
        $best_word = $word;
        $max_point = $point;
    }
}

// echo("invalid word\n");
echo $best_word;

?>
