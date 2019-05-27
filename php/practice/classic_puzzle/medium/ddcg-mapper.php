<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $L
);
fscanf(STDIN, "%d",
    $N
);
$patterns = array();
$tempos = array();
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%s %d",
        $pattern,
        $tempo
    );

    $patterns[$i] = base_convert(str_replace('X', '1', $pattern), 2, 10);
    $tempos[$i] = $tempo;
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$results = array();
for ($i = 1; $i <= $L; $i++) {
    $result = 0;
    for ($tempo_index = 0; $tempo_index < count($tempos); $tempo_index++) {
        if ($i % $tempos[$tempo_index] === 0) {
            $result  |= $patterns[$tempo_index];
        }
    }

    $result = base_convert($result, 10, 2);
    $result = sprintf('%04d', $result);
    $result = str_replace('1', 'X', $result);

    array_push($results, $result);
}


// echo("answer\n");
foreach (array_reverse($results) as $result) {
    echo $result."\n";
}

?>
