<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$word = stream_get_line(STDIN, 100 + 1, "\n");
$chars = stream_get_line(STDIN, 51 + 1, "\n");

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

define('BEAM', '+--+');
define('NO_HEAD', '|');
define('HEAD', '|  o');
define('NO_BODY', '|');
define('BODY', '|  |');
define('ONE_ARM', '| /|');
define('BOTH_ARM', '| /|\\');
define('NO_LEG', '|\\');
define('ONE_LEG', '|\\/');
define('BOTH_LEG', '|\\/ \\');
define('HANGMAN_STATUS', array(
    array(BEAM, NO_HEAD, NO_BODY, NO_LEG),
    array(BEAM, HEAD, NO_BODY, NO_LEG),
    array(BEAM, HEAD, BODY, NO_LEG),
    array(BEAM, HEAD, ONE_ARM, NO_LEG),
    array(BEAM, HEAD, BOTH_ARM, NO_LEG),
    array(BEAM, HEAD, BOTH_ARM, ONE_LEG),
    array(BEAM, HEAD, BOTH_ARM, BOTH_LEG)
));

$result = '';
foreach (str_split($word) as $char) {
    $result .= strpos($chars, strtolower($char)) !== false ? $char : '_';
}

$lower_word = strtolower($word);
$errors = 0;
foreach (explode(' ', $chars) as $char) {
    if (strpos($lower_word, $char) !== false) {
        $lower_word = str_replace($char, '', $lower_word);
    } else {
        $errors += 1;
    }
}

// echo("answer\n");
foreach (HANGMAN_STATUS[$errors] as $hangman_row) {
    echo($hangman_row . "\n");
}
echo($result);

?>
