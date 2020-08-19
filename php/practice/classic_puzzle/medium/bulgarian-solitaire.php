<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d", $N);
$inputs = explode(" ", fgets(STDIN));
$piles = [];
for ($i = 0; $i < $N; $i++)
{
    $C = intval($inputs[$i]);

    $piles[] = $C;
}

// Write an answer using echo(). DON'T FORGET THE TRAILING \n
// To debug: error_log(var_export($var, true)); (equivalent to var_dump)

$piles = array_filter($piles, function ($pile) {
    return $pile != 0;
});

$same_configuration_index = 0;
$configurations = [];

while (true) {
    sort($piles);
    $configurations[] = join(' ', $piles);

    $piles_size = sizeof($piles);
    $piles = array_filter(
        array_map(function ($pile) { return $pile - 1; }, $piles),
        function ($pile) { return $pile != 0; }
    );
    $piles[] = $piles_size;

    sort($piles);
    $configuration = join(' ', $piles);

    if (array_search($configuration, $configurations) !== false) {
        $same_configuration_index = array_search($configuration, $configurations);
        break;
    }
}

// echo("1\n");
echo(sizeof($configurations) - $same_configuration_index);

?>
