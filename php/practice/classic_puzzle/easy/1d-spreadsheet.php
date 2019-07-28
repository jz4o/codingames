<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

function get_cell_value($cell_index) {
    global $cells;

    return isset($cells[$cell_index]['value']) ? $cells[$cell_index]['value'] : calc($cell_index);
}

function arg_value($arg) {
    if (strpos($arg, '$') !== false) {
        return get_cell_value(intval(substr($arg, 1)));
    } else {
        return intval($arg);
    }
}

function calc($cell_index) {
    global $cells;

    $cell = $cells[$cell_index];
    $arg1 = arg_value($cell['arg1']);
    $arg2 = arg_value($cell['arg2']);
    $result;
    switch($cell['operation']) {
        case 'VALUE':
            $result = $arg1;
            break;
        case 'ADD':
            $result = $arg1 + $arg2;
            break;
        case 'SUB':
            $result = $arg1 - $arg2;
            break;
        case 'MULT':
            $result = $arg1 * $arg2;
            break;
    }

    $cells[$cell_index]['value'] = $result;
    return $cells[$cell_index]['value'];
}

$cells = array();
fscanf(STDIN, "%d",
    $N
);
for ($i = 0; $i < $N; $i++)
{
    fscanf(STDIN, "%s %s %s",
        $operation,
        $arg1,
        $arg2
    );
    array_push($cells, array(
        'operation' => $operation,
        'arg1'      => $arg1,
        'arg2'      => $arg2
    ));
}
for ($i = 0; $i < $N; $i++)
{

    // Write an action using echo(). DON'T FORGET THE TRAILING \n
    // To debug (equivalent to var_dump): error_log(var_export($var, true));

    // echo("1\n");
    echo get_cell_value($i)."\n";
}

?>
