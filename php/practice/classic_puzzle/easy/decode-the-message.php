<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $P);
$C = stream_get_line(STDIN, 200 + 1, "\n");

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

// echo("Good Luck :->\n");
echo(decode($P, $C));

function decode(int $encoded_value, string $alphabet): string {
    $result = '';
    $int = $encoded_value + 1;
    while ($int > 0) {
        $mod = $int % strlen($alphabet);
        $int = intval($int / strlen($alphabet));
        if ($mod === 0) {
            $int--;
        }

        $result .= $alphabet[$mod - 1];
    }

    return $result;
}

?>
