<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d",
    $H
);
$map = array();
for ($i = 0; $i < $H; $i++)
{
    $S = stream_get_line(STDIN, 128 + 1, "\n");
    array_push($map, str_split($S));
}

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));

$left_part = '/';
$right_part = '\\';
$empty_part = '.';

$is_stable = true;
for ($height = 0; $height < $H; $height++) {
    $is_bottom_row = $height == $H - 1;
    for ($width = 0; $width < $H * 2; $width++) {
        $card = $map[$height][$width];

        if ($card === $empty_part) {
            continue;
        }

        $side_card = null;
        $partner_part = null;
        if ($card === $right_part) {
            $side_card = $width === 0 ? null : $map[$height][$width - 1];
            $partner_part = $left_part;
        } else if ($card === $left_part) {
            $side_card = $width === $H * 2 - 1 ? null : $map[$height][$width + 1];
            $partner_part = $right_part;
        }

        $check_side_card = $side_card !== null && $side_card === $partner_part;
        $check_under_card = $is_bottom_row || $map[$height + 1][$width] === $partner_part;

        if (!$check_side_card || !$check_under_card) {
            $is_stable = false;
            break 2;
        }
    }
}

// echo("UNSTABLE\n");
echo $is_stable ? 'STABLE' : 'UNSTABLE';

?>
