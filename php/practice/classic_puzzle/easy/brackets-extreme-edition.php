<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%s",
    $expression
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$BRACKETS = array(
    '(' => ')',
    '[' => ']',
    '{' => '}'
);

$target = '';
foreach ($BRACKETS as $k => $v) {
    $target .= '\\'.$k.'\\'.$v;
}

$expression = preg_replace("/[^{$target}]/", '', $expression);

$result = true;
preg_match_all('/./', $expression, $chars);
$chars = $chars[0];

$tmps = array();
foreach ($chars as $char) {
    if (isset($BRACKETS[$char])) {
        array_push($tmps, $char);
    } else if (($BRACKETS[array_pop($tmps)] ?? null) == $char) {
        continue;
    } else {
        $result = false;
        break;
    }
}

// echo("true/false\n");
echo($result && empty($tmps) ? 'true' : 'false');

?>
