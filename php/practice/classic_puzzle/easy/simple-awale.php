<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

$opBowls = stream_get_line(STDIN, 100 + 1, "\n");
$opBowls = array_map('intval', explode(' ', $opBowls));
$myBowls = stream_get_line(STDIN, 100 + 1, "\n");
$myBowls = array_map('intval', explode(' ', $myBowls));
fscanf(STDIN, "%d",
    $num
);

$BOWLS_SIZE  = 7;
$PLAYER_SIZE = 2;

$bowls = array($opBowls, $myBowls);
$seeds = $bowls[$PLAYER_SIZE - 1][$num];
$bowls[$PLAYER_SIZE - 1][$num]= 0;
$index = $num + 1;

while(0 < $seeds) {
    $row_index = -((intval($index / $BOWLS_SIZE) % $PLAYER_SIZE) - 1);
    $column_index = $index % $BOWLS_SIZE;

    $enemy_store = $row_index == 0 && $column_index == $BOWLS_SIZE - 1;
    if ($enemy_store) {
        $index++;
        continue;
    }

    $bowls[$row_index][$column_index] += 1;
    $index++;
    $seeds--;
}

$op_bowls_result = implode(' ', array_slice($bowls[0], 0, -1));
$op_reserve = $bowls[0][count($opBowls) - 1];
$my_bowls_result = implode(' ', array_slice($bowls[$PLAYER_SIZE - 1], 0, -1));
$my_reserve = $bowls[$PLAYER_SIZE - 1][count($myBowls) - 1];

echo "$op_bowls_result [$op_reserve]\n";
echo "$my_bowls_result [$my_reserve]\n";
if ($index % $BOWLS_SIZE == 0) {
    echo 'REPLAY';
}

?>
