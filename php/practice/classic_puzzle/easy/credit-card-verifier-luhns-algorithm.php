<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n
);
$cards = array();
for ($i = 0; $i < $n; $i++)
{
    $card = stream_get_line(STDIN, 19 + 1, "\n");
    array_push($cards, $card);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$results = array();
foreach ($cards as $card) {
    $card = str_split(str_replace(' ', '', $card));

    $sum_numbers = 0;
    for ($i=0; $i<count($card); $i++) {
        $number = intval($card[$i]);

        if ($i % 2 == 0) {
            $number *= 2;
            if ($number >= 10) $number -= 9;
        }

        $sum_numbers += $number;
    }

    array_push($results, $sum_numbers % 10 == 0 ? 'YES' : 'NO');
}

// echo("YES or NO\n");

foreach ($results as $result) {
    echo $result."\n";
}

?>
