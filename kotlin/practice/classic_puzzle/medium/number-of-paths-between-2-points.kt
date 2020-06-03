import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val M = input.nextInt()
    val N = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: ArrayList<ArrayList<Int>> = arrayListOf()
    val gridRow: ArrayList<Int> = arrayListOf()
    for (i in 1..N + 1) {
        gridRow.add(1)
    }
    grid.add(gridRow)
    for (i in 0 until M) {
        val ROW = input.nextLine()

        val gridRow: ArrayList<Int> = arrayListOf()
        gridRow.add(1)
        ROW.toCharArray().forEach({c -> gridRow.add(Integer.parseInt(c + ""))})

        grid.add(gridRow)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val pathGrid: ArrayList<ArrayList<Int>> = arrayListOf()
    for (i in 1..M + 1) {
        val pathGridRow: ArrayList<Int> = arrayListOf()
        for (j in 1..N + 1) {
            pathGridRow.add(0)
        }

        pathGrid.add(pathGridRow)
    }
    grid[1].set(1, 1)
    pathGrid[1].set(1, 1)
    for (row in 1..M) {
        for (column in 1..N) {
            if (grid[row][column] != 0) {
                continue
            }

            val topMassPaths: Int = pathGrid[row - 1][column]
            val leftMassPaths: Int = pathGrid[row][column - 1]
            pathGrid[row].set(column, topMassPaths + leftMassPaths)
        }
    }

    // println("answer")
    println(pathGrid[M][N])
}
