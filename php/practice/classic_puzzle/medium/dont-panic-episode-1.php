<?php
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

fscanf(STDIN, "%d %d %d %d %d %d %d %d",
    $nbFloors, // number of floors
    $width, // width of the area
    $nbRounds, // maximum number of rounds
    $exitFloor, // floor on which the exit is found
    $exitPos, // position of the exit on its floor
    $nbTotalClones, // number of generated clones
    $nbAdditionalElevators, // ignore (always zero)
    $nbElevators // number of elevators
);
$elevatorFloors = array();
$elevatorPositions = array();
for ($i = 0; $i < $nbElevators; $i++)
{
    fscanf(STDIN, "%d %d",
        $elevatorFloor, // floor on which this elevator is found
        $elevatorPos // position of the elevator on its floor

    );
    array_push($elevatorFloors, $elevatorFloor);
    array_push($elevatorPositions, $elevatorPos);
}

// game loop
while (TRUE)
{
    fscanf(STDIN, "%d %d %s",
        $cloneFloor, // floor of the leading clone
        $clonePos, // position of the leading clone on its floor
        $direction // direction of the leading clone: LEFT or RIGHT
    );

    // Write an action using echo(). DON'T FORGET THE TRAILING \n
    // To debug (equivalent to var_dump): error_log(var_export($var, true));

    $elevatorIndex = array_search($cloneFloor, $elevatorFloors);
    $elevatorPosition = null;
    if ($elevatorIndex !== false) {
        $elevatorPosition = $elevatorPositions[$elevatorIndex];
    }
    $target = $elevatorPosition != null ? $elevatorPosition : $exitPos;

    $isAlreadyFacingLeftTarget = $target < $clonePos && $direction == "LEFT";
    $isAlreadyFacingRightTarget = $clonePos < $target && $direction == "RIGHT";
    $result = "";
    if ($isAlreadyFacingLeftTarget || $isAlreadyFacingRightTarget || ($target == $clonePos)) {
        $result = "WAIT";
    } else {
        $result = "BLOCK";
    }

    // echo("WAIT\n"); // action: WAIT or BLOCK
    echo $result."\n";
}

?>
