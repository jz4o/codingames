<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$combinations = array();

$TRY_POINT       = 5;
$TRANSFORM_POINT = 2;
$PENA_DROP_POINT = 3;

$possible_try_times = intval($N / $TRY_POINT);
for ($try_times=$possible_try_times; $try_times>=0; $try_times--) {
    $try_points = $TRY_POINT * $try_times;

    $possible_transfor_times = min(intval(($N - $try_points) / $TRANSFORM_POINT), $try_times);
    for ($transfor_times=$possible_transfor_times; $transfor_times>=0; $transfor_times--) {
        $transform_points = $TRANSFORM_POINT * $transfor_times;

        $remining_points = $N - $try_points - $transform_points;
        if ($remining_points % $PENA_DROP_POINT == 0) {
            $pena_drop_times = intval($remining_points / $PENA_DROP_POINT);
            array_unshift($combinations, "$try_times $transfor_times $pena_drop_times");
        }
    }
}

// echo("tries transformations penalties\n");
foreach ($combinations as $combination) {
    echo $combination."\n";
}

?>
