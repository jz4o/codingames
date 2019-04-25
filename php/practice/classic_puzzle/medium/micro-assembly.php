<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d %d %d",
    $a,
    $b,
    $c,
    $d
);
$values = array(
    'a' => $a,
    'b' => $b,
    'c' => $c,
    'd' => $d
);
fscanf(STDIN, "%d",
    $n
);
$instructions = array();
for ($i = 0; $i < $n; $i++)
{
    $instruction = stream_get_line(STDIN, 16 + 1, "\n");
    array_push($instructions, $instruction);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

for ($i = 0; $i < $n; $i++) {
    $args = explode(' ', $instructions[$i]);

    $operator = $args[0];
    $arg1 = $args[1];
    $arg2 = $values[$args[2]] ?? intval($args[2]);
    $arg3 = isset($args[3]) ? ($arg3 = $values[$args[3]] ?? intval($args[3])) : 0;

    // invert positive to negative for addition
    if ($operator === 'SUB') {
        $arg3 = -$arg3;
    }

    // execute instruction
    if ($operator === 'JNE') {
        if ($arg2 !== $arg3) {
            // minus 1 is for `for` increment
            $i = intval($arg1) - 1;
            continue;
        }
    } else {
        $values[$arg1] = $arg2 + $arg3;
    }
}

// echo("a b c d\n");
echo implode(' ', $values);

?>
