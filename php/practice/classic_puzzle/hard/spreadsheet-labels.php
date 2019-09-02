<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n
);
$inputs = fgets(STDIN);
$inputs = explode(" ",$inputs);
$labels = array();
for ($i = 0; $i < $n; $i++)
{
    $label = ($inputs[$i]);
    array_push($labels, $label);
}

define('ALPHAS', array(
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
    'U', 'V', 'W', 'X', 'Y', 'Z'
));

$result = array();
foreach ($labels as $label) {
    if (strval(intval($label)) === $label) {
        array_push($result, int_label_to_alpha_label($label));
    } else {
        array_push($result, alpha_label_to_int_label($label));
    }
}

echo implode(' ', $result);


function int_label_to_alpha_label($int_label) {
    $int_label = intval($int_label);

    $result = '';
    while ($int_label > 0) {
        $i = intval(bcmod(strval($int_label), strval(count(ALPHAS))));
        if ($i === 0) {
            $i = count(ALPHAS);
            $int_label--;
        }
        $int_label = $int_label > count(ALPHAS) ? intval(bcdiv(strval($int_label), strval(count(ALPHAS)))) : 0;
        $result = ALPHAS[$i - 1].$result;
    }

    return $result;
}

function alpha_label_to_int_label($alpha_label) {
    $result = 0;

    $chars = str_split($alpha_label);
    $chars_count = count($chars);
    for ($i = 0; $i < $chars_count; $i++) {
        $result += (pow(count(ALPHAS), $i)) * (array_search($chars[$chars_count - 1 - $i], ALPHAS) + 1);
    }

    return $result;
}

?>
