import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val line1 = input.next()
    val line2 = input.next()
    val line3 = input.next()
    val line4 = input.next()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val lines: List<String> = listOf(line1, line2, line3, line4)
    val square: MutableList<MutableList<Int>> = lines.map { it.toCharArray().map(Char::toString).map(String::toInt).toMutableList() }.toMutableList()

    val miniSudoku: MiniSudoku = MiniSudoku(square)
    miniSudoku.whileOptimize()

    // println("answer")
    println(miniSudoku)
}

class MiniSudoku(var square: MutableList<MutableList<Int>>) {
    val expectSum: Int
    var squareSum: Int

    init {
        expectSum = (1..(square.size)).sum() * square.size
        squareSum = square.map { it.sum() }.sum()
    }

    fun whileOptimize() {
        while (expectSum != squareSum) {
            optimize(square)
        }
    }

    fun optimize(square: MutableList<MutableList<Int>>) {
        square.forEachIndexed { rowIndex, row ->
            row.forEachIndexed columnLoop@{ columnIndex, column ->
                if (column != 0) {
                    return@columnLoop
                }

                val verticalLine: List<Int> = square.map { it[columnIndex] }

                val littleSquareRows: List<Int> = if (rowIndex < Math.floor(square.size / 2.0).toInt()) listOf(0, 1) else listOf(2, 3)
                val littleSquareColumns: List<Int> = if (columnIndex < Math.floor(row.size / 2.0).toInt()) listOf(0, 1) else listOf(2, 3)
                val littleSquare: List<Int> = littleSquareRows.fold(mutableListOf()) { littleSquare, littleSquareRow ->
                    littleSquare.plus(littleSquareColumns.map { littleSquareColumn -> square[littleSquareRow][littleSquareColumn] }).toMutableList()
                }

                val candidate: List<Int> = listOf(1, 2, 3, 4)
                    .filter { row.indexOf(it) == -1 }
                    .filter { verticalLine.indexOf(it) == -1 }
                    .filter { littleSquare.indexOf(it) == -1 }

                if (candidate.size == 1) {
                    val value: Int = candidate.first()

                    square[rowIndex][columnIndex] =  value
                    squareSum += value
                }
            }
        }
    }

    override fun toString(): String {
        return square.map { it.joinToString("") }
                .joinToString("\n")
    }
}
