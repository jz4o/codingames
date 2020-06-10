import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val w = input.nextInt()
    val h = input.nextInt()
    val n = input.nextLong()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: ArrayList<CharArray> = arrayListOf()
    for (i in 0 until h) {
        val line = input.nextLine()

        grid.add(line.toCharArray())
    }

    val directions: Array<String> = arrayOf("N", "E", "S", "W")
    var directionIndex: Int = 0

    var yIndex: Int = 0
    var xIndex: Int = 0
    grid.forEachIndexed { index, line ->
        if (line.contains('O')) {
            yIndex = index
            xIndex = line.indexOf('O')
        }
    }

    val initialY: Int = yIndex
    val initialX: Int = xIndex

    var turn: Long = 0
    while (turn < n) {
        turn++

        var direction: String = directions[directionIndex]

        // forward
        when(direction) {
            "N" -> yIndex--
            "E" -> xIndex++
            "W" -> xIndex--
            "S" -> yIndex++
        }

        // get ahead mass
        var aheadMass: Char = when {
            direction == "N" && yIndex > 0     -> grid[yIndex - 1][xIndex]
            direction == "E" && yIndex < w - 1 -> grid[yIndex][xIndex + 1]
            direction == "W" && xIndex > 0     -> grid[yIndex][xIndex - 1]
            direction == "S" && yIndex < h - 1 -> grid[yIndex + 1][xIndex]
            else -> ' '
        }

        // turn right if obstacle in ahead mass
        if (aheadMass == '#') {
            directionIndex = (directionIndex + 1) % directions.size
            direction = directions[directionIndex]
        }

        // omit to loop turn
        if (xIndex == initialX && yIndex == initialY && direction == "N") {
            turn = n - (n % turn)
        }
    }

    println("$xIndex $yIndex")
}
