<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $n);
$numbers = array();
for ($i = 0; $i < $n; $i++)
{
    fscanf(STDIN, "%s", $x);

    array_push($numbers, $x);
}

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

$results = array_map(function($number) { return how_to_read($number); }, $numbers);

// echo("cardinal\n");
foreach ($results as $result) {
    echo "$result\n";
}

function how_to_read($numberStr) {
    if (substr($numberStr, 0, 1) === '-') {
        return 'negative ' . how_to_read(substr($numberStr, 1));
    }

    if (strlen($numberStr) >= 4) {
        $over_thousand_unit_names = array('', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion');

        $number_size = strlen($numberStr);
        $unit_number_size = $number_size % 3 === 0 ? 3 : $number_size % 3;
        $mod_number_size = $number_size - $unit_number_size;

        $unit_number = substr($numberStr, 0, $unit_number_size);
        $mod_number = substr($numberStr, $unit_number_size);

        $result = '';
        $result .= how_to_read($unit_number) . ' ' . $over_thousand_unit_names[intval($mod_number_size / 3)];
        if (!preg_match('/^0+$/', $mod_number)) {
            $result .= ' ' . how_to_read($mod_number);
        }

        return $result;
    }

    $result = '';
    $number = intval($numberStr);
    if ($number >= 100) {
        $hundred_unit = intval($number / 100);
        $mod_unit = $number % 100;

        if ($hundred_unit > 0) {
            $result .= how_to_read(strval($hundred_unit)) . ' hundred';
        }
        if ($mod_unit > 0) {
            $result .= ' ' . how_to_read(strval($mod_unit));
        }
    } else if ($number >= 20) {
        $ten_unit_names = array('', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety');
        $ten_unit = intval($number / 10);
        $mod_unit = $number % 10;

        if ($ten_unit > 0) {
            $result .= $ten_unit_names[$ten_unit];
        }
        if ($mod_unit > 0) {
            $result .= '-' . how_to_read(strval($mod_unit));
        }
    } else {
        $under_twenty_names = array(
            'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
            'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
        );

        $result = $under_twenty_names[$number];
    }

    return $result;
}

?>
