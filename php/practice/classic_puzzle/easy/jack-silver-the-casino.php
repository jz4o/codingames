<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $ROUNDS
);
fscanf(STDIN, "%d",
    $CASH
);
$plays = array();
for ($i = 0; $i < $ROUNDS; $i++)
{
    $PLAY = stream_get_line(STDIN, 1024 + 1, "\n");
    array_push($plays, $PLAY);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

foreach ($plays as $play) {
    $CASH -= $bet = ceil($CASH / 4.0);
    list($ball, $call, $number) = array_merge(explode(' ', $play), array(null));

    $is_win_with_plain = $call == 'PLAIN' && $ball == $number;
    $is_win_with_odd   = $call == 'ODD'   && $ball % 2 == 1;
    $is_win_with_even  = $call == 'EVEN'  && $ball % 2 == 0 && $ball != 0;

    if ($is_win_with_plain) {
        $CASH += $bet * 36;
    } else if ($is_win_with_odd || $is_win_with_even) {
        $CASH += $bet * 2;
    }
}

// echo("cash of the target after playing\n");
echo $CASH;

?>
