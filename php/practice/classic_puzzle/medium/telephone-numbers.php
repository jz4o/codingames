<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$telephones = array();
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%s",
        $telephone
    );
    array_push($telephones, $telephone);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$number_hash = array();
foreach ($telephones as $telephone) {
    $target_hash = &$number_hash;
    for ($i = 0; $i < strlen($telephone); $i++) {
        $number = $telephone[$i];

        if (!isset($target_hash[$number])) {
            $target_hash[$number] = array();
        }
        $target_hash = &$target_hash[$number];
    }
}

// The number of elements (referencing a number) stored in the structure.
// echo("number\n");
echo substr_count(var_export($number_hash, true), '=>');

?>
