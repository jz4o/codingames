<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
        // ArrayList<HashMap<String, Integer>> strengths = new ArrayList<HashMap<String, Integer>>();
$strengths = array();
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%d %d",
        $V,
        $E
    );

    $hash_map = array();
    $hash_map["v"] = $V;
    $hash_map["e"] = $E;

    array_push($strengths, $hash_map);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$min_diff = null;
for ($left_index = 0; $left_index < count($strengths); $left_index++) {
    for ($right_index = $left_index + 1; $right_index < count($strengths); $right_index++) {
        $left = $strengths[$left_index];
        $right = $strengths[$right_index];

        $v_diff = abs($right["v"] - $left["v"]);
        $e_diff = abs($right["e"] - $left["e"]);
        $diff = $v_diff + $e_diff;

        if ($min_diff === null || ($diff >= 0 && $diff < $min_diff)) {
            $min_diff = $diff;
        }
    }
}

// echo("42\n");
echo $min_diff;

?>
