import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val nbFloors = input.nextInt() // number of floors
    val width = input.nextInt() // width of the area
    val nbRounds = input.nextInt() // maximum number of rounds
    val exitFloor = input.nextInt() // floor on which the exit is found
    val exitPos = input.nextInt() // position of the exit on its floor
    val nbTotalClones = input.nextInt() // number of generated clones
    val nbAdditionalElevators = input.nextInt() // ignore (always zero)
    val nbElevators = input.nextInt() // number of elevators
    val elevatorFloors: MutableList<Int> = mutableListOf()
    val elevatorPositions: MutableList<Int> = mutableListOf()
    for (i in 0 until nbElevators) {
        val elevatorFloor = input.nextInt() // floor on which this elevator is found
        val elevatorPos = input.nextInt() // position of the elevator on its floor

        elevatorFloors.add(elevatorFloor)
        elevatorPositions.add(elevatorPos)
    }

    // game loop
    while (true) {
        val cloneFloor = input.nextInt() // floor of the leading clone
        val clonePos = input.nextInt() // position of the leading clone on its floor
        val direction = input.next() // direction of the leading clone: LEFT or RIGHT

        // Write an action using println()
        // To debug: System.err.println("Debug messages...");

        val elevatorIndex: Int = elevatorFloors.indexOf(cloneFloor)
        val target: Int = if (elevatorIndex >= 0) elevatorPositions[elevatorIndex] else exitPos

        val isAlreadyFacingLeftTarget: Boolean = target < clonePos && direction == "LEFT"
        val isAlreadyFacingRightTarget: Boolean = clonePos < target && direction == "RIGHT"

        // println("WAIT") // action: WAIT or BLOCK
        if (isAlreadyFacingLeftTarget || isAlreadyFacingRightTarget || target == clonePos) {
            println("WAIT")
        } else {
            println("BLOCK")
        }
    }
}
