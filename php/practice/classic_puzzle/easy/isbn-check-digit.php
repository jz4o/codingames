<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$isbns = array();
for ($i = 0; $i < $N; $i++)
{
    $ISBN = stream_get_line(STDIN, 20 + 1, "\n");
    array_push($isbns, $ISBN);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$MODULUS_WEIGHTS = array(
    10 => array(1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3),
    11 => range(10, 1)
);

$invalids = array();
for ( $i=0; $i<$N; $i++ ) {
    $isbn = $isbns[$i];
    if (!preg_match('/^\d+X?$/', $isbn)) {
        array_push($invalids, $isbn);
        continue;
    }
    $modulus = null;
    switch(strlen($isbn)) {
        case 10:
            $modulus = 11;
            break;
        case 13:
            if (mb_substr($isbn, -1) == 'X') {
                array_push($invalids, $isbn);
                continue 2;
            }

            $modulus = 10;
            break;
        default:
            array_push($invalids, $isbn);
            continue 2;
    }

    $check_target_digits = str_split(substr($isbn, 0, -1));
    $sum = 0;
    for ($index=0; $index<count($check_target_digits); $index++) {
        $digit = $check_target_digits[$index];
        $sum += intval($digit) * $MODULUS_WEIGHTS[$modulus][$index];
    }

    $check_sum = ($modulus - ($sum % $modulus)) % $modulus;
    $check_digit = mb_substr($isbn, -1);
    $check_digit = $check_digit == 'X' ? 10 : intval($check_digit);
    if ($check_sum != $check_digit) {
        array_push($invalids, $isbn);
    }
}

// echo("answer\n");

echo(intval(count($invalids))." invalid:\n");
foreach($invalids as $invalid){
    echo($invalid."\n");
}

?>
