<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
fscanf(STDIN, "%d",
    $M
);

$voters = array();
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%s %d",
        $personName,
        $nbVote
    );
    $voters[$personName] = $nbVote;
}

$votes = array();
for ($i = 0; $i < $M; $i++)
{
    fscanf(STDIN, "%s %s",
        $voterName,
        $voteValue
    );

    if (!isset($votes[$voterName])) {
        $votes[$voterName] = array();
    }

    array_push($votes[$voterName], $voteValue);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$yes = 0;
$no  = 0;
foreach ($voters as $name => $count) {
    // skip `did not vote, or injustice vote person`
    if (!isset($votes[$name]) || count($votes[$name]) > $count) {
        continue;
    }

    $voteValues = array_count_values($votes[$name]);
    $yes += $voteValues['Yes'] ?? 0;
    $no += $voteValues['No'] ?? 0;
}

// echo("output\n");
echo $yes.' '.$no;

?>
