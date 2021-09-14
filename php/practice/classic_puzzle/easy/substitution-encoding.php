<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $rows);
$grid = [];
for ($i = 0; $i < $rows; $i++)
{
    $row = stream_get_line(STDIN, 100 + 1, "\n");

    array_push($grid, explode(' ', $row));
}
$message = stream_get_line(STDIN, 100 + 1, "\n");

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

$replace_map = [];
foreach ($grid as $row_index => $row) {
    foreach ($row as $column_index => $char) {
        $replace_map[$char] = $row_index . $column_index;
    }
}

$result = str_split($message);
$result = array_map(function($char)use($replace_map) { return $replace_map[$char]; }, $result);
$result = implode('', $result);

// echo("encode message\n");
echo($result."\n");

?>
