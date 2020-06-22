import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val width = input.nextInt()
    val height = input.nextInt()
    val temp: ArrayList<List<String>> = arrayListOf()
    for (i in 0 until height) {
        val line = input.next()

        temp.add(line.toCharArray().map({ c -> c.toString() }))
    }
    val grid: List<List<String>> = temp.toList()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    fun <T> transpose(array: List<List<T>>): List<List<T>> {
        return array[0].mapIndexed({ index, _value -> array.map({ row -> row[index] }) })
    }

    val transposedGrid: List<List<String>> = transpose(grid)
    val transposedMovedGrid: List<List<String>> = transposedGrid.map({ row -> row.sorted().reversed() })
    val movedGrid: List<List<String>> = transpose(transposedMovedGrid)

    // println("answer")
    for (row in movedGrid) {
        println(row.joinToString(""))
    }
}
