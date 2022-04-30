import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val W = input.nextInt() // number of columns.
    val H = input.nextInt() // number of rows.
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: ArrayList<List<Int>> = arrayListOf()
    for (i in 0 until H) {
        val LINE = input.nextLine() // represents a line in the grid and contains W integers. Each integer represents one room of a given type.

        grid.add(LINE.split(" ").map { d -> d.toInt() })
    }
    val EX = input.nextInt() // the coordinate along the X axis of the exit (not useful for this first mission, but must be read).

    // direction
    val TOP:    Int = 0
    val LEFT:   Int = 1
    val RIGHT:  Int = 2
    val BOTTOM: Int = 3
    val NONE:   Int = -1

    // Key   : direction of entrance
    // Value : direction of exit(index: type of panel)
    val PANEL_DESTINATION: Map<String, IntArray> = mapOf(
        "TOP"   to intArrayOf(NONE, BOTTOM, NONE,  BOTTOM, LEFT,   RIGHT,  NONE,  BOTTOM, NONE,   BOTTOM, LEFT, RIGHT, NONE,   NONE),
        "LEFT"  to intArrayOf(NONE, BOTTOM, RIGHT, NONE,   NONE,   BOTTOM, RIGHT, NONE,   BOTTOM, BOTTOM, NONE, NONE,  NONE,   BOTTOM),
        "RIGHT" to intArrayOf(NONE, BOTTOM, LEFT,  NONE,   BOTTOM, NONE,   LEFT,  BOTTOM, BOTTOM, NONE,   NONE, NONE,  BOTTOM, NONE)
    )

    // game loop
    while (true) {
        val XI = input.nextInt()
        val YI = input.nextInt()
        val POS = input.next()

        // Write an action using println()
        // To debug: System.err.println("Debug messages...");

        val panelType: Int = grid[YI][XI]
        val nextDest: Int = PANEL_DESTINATION[POS]!![panelType]

        var nextXi: Int = XI
        var nextYi: Int = YI
        when (nextDest) {
            LEFT   -> nextXi--
            RIGHT  -> nextXi++
            BOTTOM -> nextYi++
        }

        // One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.
        // println("0 0")
        println("$nextXi $nextYi")
    }
}
