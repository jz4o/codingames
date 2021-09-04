<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $N);
$transactions = [];
for ($i = 0; $i < $N; $i++)
{
    $transaction = stream_get_line(STDIN, 32 + 1, "\n");

    array_push($transactions, $transaction);
}

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

$benford_law_percentages = [0, 0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046];
$first_numbers = array_map(
    function($transaction) {
        preg_match('/[1-9]/', $transaction, $matched);
        return array_shift($matched);
    },
    $transactions
);

$is_fraudulent = false;
foreach (range(1, 9) as $i) {
    $benford_law_percentage = $benford_law_percentages[$i];
    $percent = array_count_values($first_numbers)[$i] / $N;

    $is_fraudulent |= !(($benford_law_percentage - 0.1) <= $percent && $percent <= ($benford_law_percentage + 0.1));
}

// echo("false\n");
echo($is_fraudulent ? 'true' : 'false');

?>
