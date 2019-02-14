<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $N
);
$XthenCOMMANDS = stream_get_line(STDIN, 256 + 1, "\n");
$r_then_road_patterns = array();
for ($i = 0; $i < $N; $i++)
{
    $RthenROADPATTERN = stream_get_line(STDIN, 256 + 1, "\n");
    array_push($r_then_road_patterns, $RthenROADPATTERN);
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

// parse command
$x_then_commands_array = explode(";", $XthenCOMMANDS);
$position = intval($x_then_commands_array[0]);

$commands = array();
for ($i = 1; $i < count($x_then_commands_array); $i++) {
    $x_then_command = $x_then_commands_array[$i];

    $time = intval(substr($x_then_command, 0, strlen($x_then_command) - 1));
    $command = substr($x_then_command, strlen($x_then_command) - 1);

    for ($t = 0; $t < $time; $t++) {
        array_push($commands, $command);
    }
}

// driving
$results = array();
foreach ($r_then_road_patterns as $r_then_road_pattern) {
    $semicolon_index = strpos($r_then_road_pattern, ";");

    $count = intval(substr($r_then_road_pattern, 0, $semicolon_index));
    $pattern = substr($r_then_road_pattern, $semicolon_index + 1);

    for ($c = 0; $c < $count; $c++) {
        switch (array_shift($commands)) {
            case "L":
                $position--;
                break;
            case "R":
                $position++;
                break;
        }

        $left_part  = substr($pattern, 0, $position - 1);
        $right_part = substr($pattern, $position);

        array_push($results, $left_part."#".$right_part);
    }
}

// echo("answer\n");
foreach ($results as $result) {
    echo($result."\n");
}

?>
