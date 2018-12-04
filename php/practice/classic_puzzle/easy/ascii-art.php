<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $L
);
fscanf(STDIN, "%d",
    $H
);
$T = stream_get_line(STDIN, 256 + 1, "\n");
$rows = array();
for ($i = 0; $i < $H; $i++)
{
    $ROW = stream_get_line(STDIN, 1024 + 1, "\n");
    array_push($rows, $ROW);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$ALPHAS = array_merge(range('A', 'Z'), array('?'));
$result = array_fill(0, $H, '');

$t_chars = str_split(strtoupper($T), 1);
foreach($t_chars as $t_char) {
    $str_index = array_search($t_char, $ALPHAS);
    if ($str_index === false) $str_index = count($ALPHAS) - 1;
    for($i=0; $i<$H; $i++){
        $result[$i] .= substr($rows[$i], $L*$str_index, $L);
    }
}

// echo("answer\n");
foreach($result as $line) {
    echo($line."\n");
}

?>
