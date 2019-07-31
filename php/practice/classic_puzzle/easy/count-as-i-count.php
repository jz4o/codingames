<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $n
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

define('TARGET_SCORE', 50);
define('POSSIBLE_ROUNDS', 4);

$result = 0;
$patterns = array(
    ((string) $n) => array(
        'numbers' => array($n),
        'count'   => 1,
        'score'   => $n
    )
);

while (count($patterns) > 0) {
    $pattern = array_shift($patterns);

    // between 2 and 12 is 2 patterns for PN and N
    $points = array_merge(range(1, 12), range(2, 12));
    foreach ($points as $point) {
        $new_numbers = array_merge($pattern['numbers'], array($point));
        sort($new_numbers);
        $new_numbers = implode(' ', $new_numbers);

        if (isset($patterns[$new_numbers])) {
            $patterns[$new_numbers]['count'] += $pattern['count'];
        } else {
            $patterns[$new_numbers] = array(
                'numbers' => array_merge($pattern['numbers'], array($point)),
                'count'   => $pattern['count'],
                'score'   => $pattern['score'] + $point
            );
        }
    }

    // delete pattern for over score or over rounds
    // add possible pattern to result
    $keys = array_keys($patterns);
    foreach ($keys as $key) {
        if ($patterns[$key]['score'] > TARGET_SCORE || count($patterns[$key]['numbers']) > POSSIBLE_ROUNDS + 1) {
            unset($patterns[$key]);
        } else if ($patterns[$key]['score'] === TARGET_SCORE) {
            $result += $patterns[$key]['count'];
            unset($patterns[$key]);
        }
    }
}

// echo("answer\n");
echo $result;

?>
