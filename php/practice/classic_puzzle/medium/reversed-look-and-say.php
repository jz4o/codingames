<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$s = stream_get_line(STDIN, 256 + 1, "\n");

while (is_encodable($s)) {
    $s = encode($s);
}

echo $s;

function is_encodable($origin) {
    $encoded = encode($origin);
    return $encoded !== null && $encoded !== $origin;
}

function encode($origin) {
    if (strlen($origin) % 2 === 1) {
        return null;
    }

    $encoded = '';
    $chars = str_split($origin);
    for ($i = 0; $i < count($chars); $i += 2) {
        $encoded .= str_repeat($chars[$i + 1], $chars[$i]);
    }

    return is_decodable($encoded, $origin) ? $encoded : null;
}

function is_decodable($encoded, $origin) {
    $decoded = '';
    $str_temp = $encoded;

    while (!empty($str_temp)) {
        $first_char = $str_temp[0];

        preg_match('/'.$first_char.'+/', $str_temp, $matched);
        $matched = $matched[0];
        $str_temp = substr($str_temp, strlen($matched), strlen($str_temp));

        $decoded .= strlen($matched).$first_char;
    }

    return $decoded === $origin;
}

?>
