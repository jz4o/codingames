import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val N = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: MutableList<MutableList<String>> = mutableListOf()
    for (i in 0 until N) {
        val line = input.nextLine()

        grid.add(if (line.equals("")) mutableListOf() else line.toCharArray().map(Char::toString).toMutableList())
    }

    val width: Int = (grid.map { it.size }.maxOrNull() ?: 0) + 2

    grid.forEach {
        while (it.size < width) {
            it.add(" ")
        }
    }

    grid.add(Array(width) {" "}.toMutableList())
    grid.add(Array(width) {" "}.toMutableList())

    (0..N + 1).reversed().forEach { rowIndex ->
        (0..width - 1).reversed().forEach { columnIndex ->
            if (!grid.get(rowIndex).get(columnIndex).equals(" ")) {
                return@forEach
            }

            if (rowIndex >= 2 && columnIndex >= 2 && !grid.get(rowIndex - 2).get(columnIndex - 2).equals(" ")) {
                grid.get(rowIndex).set(columnIndex, "`")
            }

            if (rowIndex >= 1 && columnIndex >= 1 && !grid.get(rowIndex - 1).get(columnIndex - 1).equals(" ")) {
                grid.get(rowIndex).set(columnIndex, "-")
            }
        }
    }

    grid.forEach {
        println(it.joinToString("").trimEnd())
    }
}
