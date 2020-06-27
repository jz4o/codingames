import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val size = input.nextInt()
    val angle = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: ArrayList<MutableList<String>> = arrayListOf()
    for (i in 0 until size) {
        val line = input.nextLine()

        grid.add(line.split(" ").toMutableList())
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    fun <T> transpose(list: List<List<T>>): List<List<T>> =
        list.first().mapIndexed { index, _ -> list.map { row -> row[index] } }

    val DIAGONAL_SIZE: Int = size * 2 - 1

    val rotateCount: Int = ((angle - 45) % 360) / 90
    var rotateGrid: List<MutableList<String>> = grid
    for (i in 0 until rotateCount) {
        rotateGrid = transpose(rotateGrid).reversed().map { it.toMutableList() }
    }

    val diamondGrid: ArrayList<String> = arrayListOf()
    for (time in 1..DIAGONAL_SIZE) {
        val start: Int = Math.max(0, time - size)
        val width: Int = Math.min(time, size * 2 - time)

        val diamondRow: ArrayList<String> = arrayListOf()

        for (s in 0 until width) {
            diamondRow.add(rotateGrid[start + s].removeAt(rotateGrid[start + s].size - 1))
        }

        val spaceSize: Int = size - diamondRow.size
        val space: String = " ".repeat(spaceSize)

        diamondGrid.add("$space${diamondRow.joinToString(" ")}$space")
    }

    // println("answer")
    for (diamondRow in diamondGrid) {
        println(diamondRow)
    }
}
