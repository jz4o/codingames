<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $R
);
fscanf(STDIN, "%d",
    $L
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$result = array($R);
for ($i = 0; $i < $L - 1; $i++) {
    $temp = $result;
    $result = array();

    while (!empty($temp)) {
        $uniq_array = array_unique($temp);
        $first_element = array_shift($uniq_array);
        $another_element = array_shift($uniq_array);
        $delete_size = $another_element != null ? array_search($another_element, $temp) : count($temp);

        array_push($result, $delete_size, $first_element);
        $temp = array_slice($temp, $delete_size);
    }
}

// echo("answer\n");
echo implode(' ', $result);

?>
