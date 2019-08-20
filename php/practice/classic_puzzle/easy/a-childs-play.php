<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d",
    $w,
    $h
);
fscanf(STDIN, "%d",
    $n
);
$map = array();
for ($i = 0; $i < $h; $i++)
{
    $line = stream_get_line(STDIN, 500 + 1, "\n");

    array_push($map, str_split($line));
}

class Robot {
    function __construct() {
        $this->directions = array('N', 'E', 'S', 'W');
    }

    function set_place($x, $y) {
        $this->initial_x = $this->x = $x;
        $this->initial_y = $this->y = $y;
    }

    function place() {
        return $this->x.' '.$this->y;
    }

    function is_initial_place() {
        return $this->x === $this->initial_x && $this->y === $this->initial_y && $this->direction() === 'N';
    }

    function direction() {
        return $this->directions[0];
    }

    function forward() {
        switch($this->direction()) {
            case 'N':
                $this->y--;
                break;
            case 'E':
                $this->x++;
                break;
            case 'S':
                $this->y++;
                break;
            case 'W':
                $this->x--;
                break;
        }
    }

    function ahead_mass_index() {
        switch($this->direction()) {
            case 'N':
                return array($this->y - 1, $this->x);
            case 'E':
                return array($this->y, $this->x + 1);
            case 'S':
                return array($this->y + 1, $this->x);
            case 'W':
                return array($this->y, $this->x - 1);
        }
    }

    function turn_right() {
        array_push($this->directions, array_shift($this->directions));
    }
}

$robot = new Robot();
for ($i = 0; $i < $h; $i++) {
    if (array_search('O', $map[$i]) !== false) {
        $robot->set_place(array_search('O', $map[$i]), $i);
        break;
    }
}

$turn = 0;
while ($turn < $n) {
    $turn++;

    $robot->forward();
    $ahead_mass_index = $robot->ahead_mass_index();
    if ($map[$ahead_mass_index[0]][$ahead_mass_index[1]] === '#') {
        $robot->turn_right();
    }

    if ($robot->is_initial_place()) {
        $turn = $n - ($n % $turn);
    }
}

echo $robot->place();

?>
