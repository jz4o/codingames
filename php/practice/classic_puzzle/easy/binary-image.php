<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $h);
$rows = [];
for ($i = 0; $i < $h; $i++)
{
    $row = stream_get_line(STDIN, 200 + 1, "\n");

    array_push($rows, $row);
}
$results = [];
for ($i = 0; $i < $h; $i++)
{

    // Write an answer using echo(). DON'T FORGET THE TRAILING \n
    // To debug: error_log(var_export($var, true)); (equivalent to var_dump)

    $row = $rows[$i];

    $result = '';
    foreach (explode(' ', $row) as $index => $length) {
        $result .= str_repeat($index % 2 === 0 ? '.' : 'O', $length);
    }

    array_push($results, $result);

    // echo("answer\n");
}

$result_lengths = array_map(function($result) { return strlen($result); }, $results);
$uniq_result_lengths = array_unique($result_lengths);
$uniq_count = count($uniq_result_lengths);

echo $uniq_count === 1 ? implode("\n", $results) : "INVALID\n";

?>
