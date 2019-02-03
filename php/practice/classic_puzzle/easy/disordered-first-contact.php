<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$MESSAGE = stream_get_line(STDIN, 1024 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

for ($i = 0; $i < abs($N); $i++) {
    if ($N > 0) {
        $MESSAGE = decode($MESSAGE);
    } else {
        $MESSAGE = encode($MESSAGE);
    }
}

// echo("answer\n");
echo $MESSAGE."\n";


function decode($text) {
    $result = "";

    $turn = 1;
    $sum = $turn;
    while ($sum < strlen($text)) {
        $sum += ++$turn;
    }

    $sum -= $turn;
    while ($turn > 0) {
        $slice_size = strlen($text) - $sum;
        if ($turn % 2 === 1) {
            // slice from right
            $result = substr($text, strlen($text) - $slice_size).$result;
            $text = substr($text, 0, strlen($text) - $slice_size);
        } else {
            // slice from left
            $result = substr($text, 0, $slice_size).$result;
            $text = substr($text, $slice_size);
        }

        $sum -= --$turn;
    }

    return $result;
}

function encode($text) {
    $target = "";
    $result = "";

    $turn = 1;
    do {
        // slice from left
        $turn_is_over_text_length = $turn >= strlen($text);
        $slice_size = $turn_is_over_text_length ? strlen($text) : $turn;
        $target = substr($text, 0, $slice_size);
        if ($turn_is_over_text_length) {
            $text = "";
        } else {
            $text = substr($text, $turn);
        }

        // insert into left or right.
        if ($turn % 2 === 1) {
            $result.= $target;
        } else {
            $result = $target.$result;
        }

        $turn++;
    } while (strlen($text) > 0);

    return $result;
}

?>
