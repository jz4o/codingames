import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val W = input.nextInt()
    val H = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: MutableList<List<Char>> = mutableListOf()
    for (i in 0 until H) {
        val ROW = input.nextLine()

        grid.add(ROW.toCharArray().toList())
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val horizontalBlockCount: List<Int> = grid.map { row -> row.filter { it == '#' }.size }
    val verticalBlockCount: List<Int> = transpose(grid).map { row -> row.filter { it == '#' }.size }

    val filledHorizontalLineCount: Int = horizontalBlockCount.filter { it == W }.size
    val filledVerticalLineCount: Int = verticalBlockCount.filter { it == H }.size
    val filledCount: Int = filledHorizontalLineCount + filledVerticalLineCount

    val result: Int = grid.foldIndexed(filledCount) rowLoop@{ rowIndex, rowResult, row ->
        if (rowIndex == H - 1) {
            return@rowLoop rowResult
        }

        return@rowLoop row.foldIndexed(rowResult) columnLoop@{ columnIndex, columnResult, _ ->
            if (columnIndex == W - 1) {
                return@columnLoop columnResult
            }

            val targetMasses: List<Char> = listOf(
                grid[rowIndex][columnIndex],
                grid[rowIndex][columnIndex + 1],
                grid[rowIndex + 1][columnIndex],
                grid[rowIndex + 1][columnIndex + 1]
            )
            if (targetMasses.any { it != '.' }) {
                return@columnLoop columnResult
            }

            val newFilledLineCount: Int = listOf(
                horizontalBlockCount[rowIndex]      + 2 == W,
                horizontalBlockCount[rowIndex + 1]  + 2 == W,
                verticalBlockCount[columnIndex]     + 2 == H,
                verticalBlockCount[columnIndex + 1] + 2 == H
            ).count { it }

            Math.max(columnResult, filledCount + newFilledLineCount)
        }
    }

    // println("answer")
    println(result)
}

fun <T> transpose(list: List<List<T>>): List<List<T>> =
    list.first().mapIndexed { index, _ ->
        list.map { row -> row[index] }
    }

