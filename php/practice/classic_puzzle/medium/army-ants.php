<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $N1,
    $N2
);
fscanf(STDIN, "%s",
    $S1
);
fscanf(STDIN, "%s",
    $S2
);
fscanf(STDIN, "%d",
    $T
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$s1_move_part = str_split(substr($S1, 0, min($T, strlen($S1))));
$s2_move_part = str_split(substr($S2, 0, min($T, strlen($S2))));
$s1_move_part = array_reverse($s1_move_part);

while (count($s1_move_part) < $T) { array_unshift($s1_move_part, ''); }
while (count($s2_move_part) < $T) { array_push($s2_move_part, ''); }

$s_move_part = '';
foreach (array_map(null, $s2_move_part, $s1_move_part) as $row) {
    $s_move_part .= implode('', $row);
}

$s1_not_move_part = strlen($S1) < $T ? "" : strrev(substr($S1, $T));
$s2_not_move_part = strlen($S2) < $T ? "" : substr($S2, $T);

// echo("answer\n");
echo $s1_not_move_part.$s_move_part.$s2_not_move_part;

?>
