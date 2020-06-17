import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val n = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: ArrayList<ArrayList<Int>> = arrayListOf()
    for (i in 0 until n) {
        val row = input.nextLine()

        grid.add(ArrayList(row.toCharArray().map{ c -> c.toString().toInt() }))
    }
    for (i in 0 until n) {
        val row = input.nextLine()

        for ((index, c) in row.toCharArray().withIndex()) {
            grid[i][index] += c.toString().toInt()
        }
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val BORDER: Int = 4
    while (grid.any { it.any { it >= BORDER } }) {
        for ((rowIndex, row) in grid.withIndex()) {
            for ((columnIndex, value) in row.withIndex()) {
                if (value < BORDER) {
                    continue
                }

                grid[rowIndex][columnIndex] -= BORDER
                if (rowIndex > 0)         { grid[rowIndex - 1][columnIndex]++ } // above
                if (rowIndex + 1 != n)    { grid[rowIndex + 1][columnIndex]++ } // below
                if (columnIndex > 0)      { grid[rowIndex][columnIndex - 1]++ } // left
                if (columnIndex + 1 != n) { grid[rowIndex][columnIndex + 1]++ } // right
            }
        }
    }

    // println("answer")
    for (row in grid) {
        println(row.joinToString(""))
    }
}
