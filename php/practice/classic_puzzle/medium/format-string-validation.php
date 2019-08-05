<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$text = stream_get_line(STDIN, 1000 + 1, "\n");
$format = stream_get_line(STDIN, 100 + 1, "\n");

$format = str_replace('\\', '\\\\', $format);
$special_strings = array('/', '^', '*', '(', ')', '[', ']', '$');
foreach ($special_strings as $special_string) {
    $format = str_replace($special_string, '\\'.$special_string, $format);
}
$format = str_replace('?', '.', $format);
$format = str_replace('~', '.*', $format);

echo preg_match('/'.$format.'/', $text) === 1 ? 'MATCH' : 'FAIL';

?>
