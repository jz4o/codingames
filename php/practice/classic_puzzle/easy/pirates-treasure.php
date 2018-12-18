<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $W
);
fscanf(STDIN, "%d",
    $H
);
$map = array();
array_push($map, array_pad(array(), $W + 2, 1));
for ($i = 0; $i < $H; $i++)
{
    $inputs = fgets(STDIN);
    $inputs = explode(" ",$inputs);
    $line = array();
    array_push($line, 1);
    for ($j = 0; $j < $W; $j++)
    {
        $v = intval($inputs[$j]);
        array_push($line, $v);
    }
    array_push($line, 1);

    array_push($map, $line);
}
array_push($map, array_pad(array(), $W + 2, 1));

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$treasure_line_index = null;
$treasure_mass_index = null;
for ($line_index=1; $line_index<=$H; $line_index++) {
    for ($mass_index=1; $mass_index<=$W; $mass_index++) {
        $around_masses = array(
            $map[$line_index-1][$mass_index-1], // upper left
            $map[$line_index-1][$mass_index],   // up
            $map[$line_index-1][$mass_index+1], // upper right
            $map[$line_index][$mass_index-1],   // left
            $map[$line_index][$mass_index+1],   // right
            $map[$line_index+1][$mass_index-1], // bottom left
            $map[$line_index+1][$mass_index],   // under
            $map[$line_index+1][$mass_index+1]  // bottom right
        );

        $here_is_zero = $map[$line_index][$mass_index] == 0;
        $zero_is_not_found_for_around = array_search(0, $around_masses) === false;

        if ($here_is_zero && $zero_is_not_found_for_around) {
            $treasure_line_index = $line_index - 1; // minus dummy line
            $treasure_mass_index = $mass_index - 1; // minus dummy mass

            // exit from two loop
            break 2;
        }
    }
}

// echo("x y\n");

echo $treasure_mass_index.' '.$treasure_line_index;

?>
