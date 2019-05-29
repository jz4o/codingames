<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $R
);
fscanf(STDIN, "%d",
    $N
);
fscanf(STDIN, "%s",
    $startPattern
);

$rDigits = array_reverse(str_split(str_pad(base_convert($R, 10, 2), 8, 0, STR_PAD_LEFT)));
$startPattern = str_replace('@', '1', str_replace('.', '0', $startPattern));

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$ruleLength = 8;
$rule = array();
for ($i = 0; $i < $ruleLength; $i++) {
    $key = str_pad(base_convert($i, 10, 2), 3, 0, STR_PAD_LEFT);
    $value = $rDigits[$i];

    $rule[$key] = $value;
}

$results = array();
for ($i = 0; $i < $N; $i++) {
    array_push($results, str_replace('1', '@', str_replace('0', '.', $startPattern)));

    $result = "";
    $startPattern = $startPattern[-1].$startPattern.$startPattern[0];

    for ($j = 0; $j < strlen($startPattern) - 2; $j++) {
        $ruleKey = $startPattern[$j].$startPattern[$j + 1].$startPattern[$j + 2];
        $result .= $rule[$ruleKey];
    }

    $startPattern = $result;
}

// echo(".....@.@.....\n");
foreach ($results as $result) {
    echo $result."\n";
}

?>
