package main

import "fmt"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    // nbFloors: number of floors
    // width: width of the area
    // nbRounds: maximum number of rounds
    // exitFloor: floor on which the exit is found
    // exitPos: position of the exit on its floor
    // nbTotalClones: number of generated clones
    // nbAdditionalElevators: ignore (always zero)
    // nbElevators: number of elevators
    var nbFloors, width, nbRounds, exitFloor, exitPos, nbTotalClones, nbAdditionalElevators, nbElevators int
    fmt.Scan(&nbFloors, &width, &nbRounds, &exitFloor, &exitPos, &nbTotalClones, &nbAdditionalElevators, &nbElevators)

    elevatorFloors := []int{}
    elevatorPoss := []int{}
    for i := 0; i < nbElevators; i++ {
        // elevatorFloor: floor on which this elevator is found
        // elevatorPos: position of the elevator on its floor
        var elevatorFloor, elevatorPos int
        fmt.Scan(&elevatorFloor, &elevatorPos)

        elevatorFloors = append(elevatorFloors, elevatorFloor)
        elevatorPoss = append(elevatorPoss, elevatorPos)
    }
    for {
        // cloneFloor: floor of the leading clone
        // clonePos: position of the leading clone on its floor
        // direction: direction of the leading clone: LEFT or RIGHT
        var cloneFloor, clonePos int
        var direction string
        fmt.Scan(&cloneFloor, &clonePos, &direction)

        target := exitPos
        for i := 0; i < len(elevatorFloors); i++ {
            if elevatorFloors[i] == cloneFloor {
                target = elevatorPoss[i]
                break
            }
        }

        isAlreadyFacingLeftTarget := target < clonePos && direction == "LEFT"
        isAlreadyFacingRightTarget := clonePos < target && direction == "RIGHT"

        result := "BLOCK"
        if isAlreadyFacingLeftTarget || isAlreadyFacingRightTarget || target == clonePos {
            result = "WAIT"
        }

        // fmt.Fprintln(os.Stderr, "Debug messages...")
        // fmt.Println("WAIT") // action: WAIT or BLOCK
        fmt.Println(result)
    }
}

