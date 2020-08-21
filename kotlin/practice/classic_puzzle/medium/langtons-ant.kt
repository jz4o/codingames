import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val MARKS: Map<String, String> = mapOf(
        "black" to "#",
        "white" to "."
    )
    val directions: MutableList<String> = mutableListOf("N", "E", "S", "W")
    val input = Scanner(System.`in`)
    val W = input.nextInt()
    val H = input.nextInt()
    val x = input.nextInt()
    val y = input.nextInt()
    var xTmp: Int = x
    var yTmp: Int = y
    val direction = input.next()
    while (directions.first() != direction) {
        directions.add(directions.removeAt(0))
    }
    val T = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: MutableList<MutableList<String>> = mutableListOf()
    for (i in 0 until H) {
        val C = input.nextLine()

        grid.add(C.toCharArray().map(Char::toString).toMutableList())
    }
    for (i in 0 until T) {

        // Write an answer using println()
        // To debug: System.err.println("Debug messages...");

        val colorIsBlack: Boolean = grid[yTmp][xTmp] == MARKS["black"]
        if (colorIsBlack) {
            directions.add(directions.removeAt(0))
        } else {
            directions.add(0, directions.removeAt(directions.size - 1))
        }

        grid[yTmp][xTmp] = (if (colorIsBlack) MARKS["white"] else MARKS["black"])!!

        when (directions.first()) {
            "N" -> yTmp--
            "E" -> xTmp++
            "W" -> xTmp--
            "S" -> yTmp++
        }

        // println("answer")
    }

    for (row in grid) {
        println(row.joinToString(""))
    }
}
