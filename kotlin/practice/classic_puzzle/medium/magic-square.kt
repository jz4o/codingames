import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val grid: MutableList<MutableList<Int>> = mutableListOf()
    val n = input.nextInt()
    for (i in 0 until n) {
        grid.add(mutableListOf())
        for (j in 0 until n) {
            val c = input.nextInt()

            grid.last().add(c)
        }
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val expectAllSum: Int = (1..(n * n)).sum()
    val allSum: Int = grid.map { it.sum() }.sum()

    val lines: MutableList<List<Int>> = mutableListOf()
    lines.addAll(grid)
    lines.addAll(transpose(grid))
    lines.add(grid.mapIndexed { index, row -> row[index] })
    lines.add(grid.mapIndexed { index, row -> row[row.size - index - 1] })
    val lineSums: List<Int> = lines.map { it.sum() }

    val isExpectedAllSum: Boolean = allSum == expectAllSum
    val isExpectedAllLineSums: Boolean = lineSums.all { it == lineSums.first() }

    val result: String = if (isExpectedAllSum && isExpectedAllLineSums) "MAGIC" else "MUGGLE"

    // println("answer")
    println(result)
}

fun <T> transpose(list: List<List<T>>): List<List<T>> =
    list.first().mapIndexed { index, _ ->
        list.map { row -> row[index] }
    }
