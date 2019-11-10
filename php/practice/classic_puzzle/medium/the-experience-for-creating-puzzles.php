<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $Level
);
fscanf(STDIN, "%d",
    $Xp
);
fscanf(STDIN, "%d",
    $N
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

define('EXP_OF_PUZZLE', 300);

// echo("answer\n");
list($level, $exp) = reflect_exp($Level, EXP_OF_PUZZLE * $N, $Xp);
echo $level."\n";
echo $exp."\n";

/**
 * reflect experience value
 *
 * @param Integer level       current level
 * @param Integer exp         experience value
 * @param Integer levelup_exp necessary experience value for level up
 *
 * @return Array(level, exp)
 *           level  level after reflect experience value
 *           exp    necessary experience value for next level up
 */
function reflect_exp($level, $exp, $levelup_exp = null) {
    $exp -= $levelup_exp ?? get_exp_for_levelup($level);
    return $exp < 0 ? array($level, -$exp) : reflect_exp($level + 1, $exp);
}

function get_exp_for_levelup($current_level) {
    return floor($current_level * sqrt($current_level) * 10);
}

?>
