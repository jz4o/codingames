<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $N);
$cgs_contents = array();
for ($i = 0; $i < $N; $i++)
{
    $cgsContent = stream_get_line(STDIN, 256 + 1, "\n");
    array_push($cgs_contents, $cgsContent);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$variables  = array();
$characters = array();
$replace_character = 'a';
foreach ($cgs_contents as $index => $cgs_content) {
    // replace variable part
    preg_match_all("/\\$.+?\\$/", $cgs_content, $matched_variables);
    foreach ($matched_variables[0] as $variable) {
        if (!isset($variables[$variable])) {
            $variables[$variable] = '$'.$replace_character.'$';
            $replace_character++;
        }
        $cgs_content = str_replace($variable, $variables[$variable], $cgs_content);
    }

    // replace character part
    preg_match_all("/'.+'/", $cgs_content, $matched_characters);
    foreach ($matched_characters[0] as $character) {
        $cgs_content = str_replace($character, '$'.count($characters), $cgs_content);
        array_push($characters, $character);
    }

    $cgs_contents[$index] = str_replace(' ', '', $cgs_content);
}

// restore character part
$result = implode('', $cgs_contents);
foreach ($characters as $index => $character) {
    $result = str_replace('$'.$index, $character, $result);
}

// echo("minified all CGS content\n");
echo $result

?>
