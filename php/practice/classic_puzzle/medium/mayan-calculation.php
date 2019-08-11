<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

define('MAYAN_NUMBER_COUNT', 20);

fscanf(STDIN, "%d %d",
    $L,
    $H
);
$ascii_mayans = array_fill(0, MAYAN_NUMBER_COUNT, '');
for ($i = 0; $i < $H; $i++)
{
    fscanf(STDIN, "%s",
        $numeral
    );

    $mayan_rows = str_split($numeral, $L);
    for ($j = 0; $j < count($mayan_rows); $j++) {
        $ascii_mayans[$j] .= $mayan_rows[$j];
    }
}
$mayan_2_int = array();
for ($i = 0; $i < MAYAN_NUMBER_COUNT; $i++) {
    $mayan_2_int[$ascii_mayans[$i]] = $i;
}

fscanf(STDIN, "%d",
    $S1
);
$mayan1 = array();
$temp_str = '';
for ($i = 0; $i < $S1; $i++)
{
    fscanf(STDIN, "%s",
        $num1Line
    );

    $temp_str .= $num1Line;
    if (($i + 1) % $H === 0) {
        $mayan1[intval($i / $H)] = $temp_str;
        $temp_str = '';
    }
}

fscanf(STDIN, "%d",
    $S2
);
$mayan2 = array();
$temp_str = '';
for ($i = 0; $i < $S2; $i++)
{
    fscanf(STDIN, "%s",
        $num2Line
    );

    $temp_str .= $num2Line;
    if (($i + 1) % $H === 0) {
        $mayan2[intval($i / $H)] = $temp_str;
        $temp_str = '';
    }
}

fscanf(STDIN, "%s",
    $operation
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$num1 = 0;
for ($i = 0; $i < count($mayan1); $i++) {
    $num1 += pow(MAYAN_NUMBER_COUNT, count($mayan1) - 1 - $i) * $mayan_2_int[$mayan1[$i]];
}

$num2 = 0;
for ($i = 0; $i < count($mayan2); $i++) {
    $num2 += pow(MAYAN_NUMBER_COUNT, count($mayan2) - 1 - $i) * $mayan_2_int[$mayan2[$i]];
}

$result_num = 0;
switch($operation) {
    case '+':
        $result_num = $num1 + $num2;
        break;
    case '-':
        $result_num = $num1 - $num2;
        break;
    case '*':
        $result_num = $num1 * $num2;
        break;
    case '/':
        $result_num = $num1 / $num2;
        break;
}

$result = '';
do {
    $div = intval($result_num / MAYAN_NUMBER_COUNT);
    $mod = $result_num - MAYAN_NUMBER_COUNT * $div;
    $result_num = $div;

    $ascii_mayan = implode("\n", str_split($ascii_mayans[$mod], $L));
    $result = $ascii_mayan."\n".$result;
} while ($result_num > 0);

// echo("result\n");
echo $result;

?>
