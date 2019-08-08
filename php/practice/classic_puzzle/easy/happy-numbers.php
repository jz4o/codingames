<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$xs = array();
for ($i = 0; $i < $N; $i++)
{
    $x = stream_get_line(STDIN, 128 + 1, "\n");
    array_push($xs, $x);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

define('HAPPY_NUMBER', '1');
define('HAPPY_FACE', ':)');
define('UNHAPPY_FACE', ':(');

$results = array();
foreach ($xs as $x) {
    $temp = $x;
    $exit_numbers = array(HAPPY_NUMBER);
    while (array_search($temp, $exit_numbers) === false) {
        array_push($exit_numbers, $temp);
        $sum = 0;
        foreach (str_split($temp) as $t) {
            $sum += pow(intval($t), 2);
        }
        $temp = strval($sum);
    }
    $result_face = $temp === HAPPY_NUMBER ? HAPPY_FACE : UNHAPPY_FACE;

    array_push($results, $x.' '.$result_face);
}

// echo("23 :)\n");
foreach ($results  as $result) {
    echo $result."\n";
}

?>
