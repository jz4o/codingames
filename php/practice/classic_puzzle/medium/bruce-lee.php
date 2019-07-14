<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$ENCRYPT = stream_get_line(STDIN, 4095 + 1, "\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$binaries = '';
$encrypt_elements = explode(' ', $ENCRYPT);
$invalid_flag = count($encrypt_elements) % 2 !== 0;
for ($i = 0; $i < count($encrypt_elements); $i += 2) {
    if ($invalid_flag) {
        break;
    }

    $binary = $encrypt_elements[$i];
    $count = strlen($encrypt_elements[$i + 1]);

    $invalid_flag = $binary !== '0' && $binary !== '00';

    $binaries .= str_repeat($binary === '0' ? '1' : '0', $count);
}

// echo("INVALID\n");
$result = '';
if ($invalid_flag || strlen($binaries) % 7 !== 0) {
    $result = 'INVALID';
} else {
    foreach (str_split($binaries, 7) as $binary) {
        $result .= chr(base_convert($binary, 2, 10));
    }
}
echo $result;

?>
