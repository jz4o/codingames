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
    val grid: MutableList<MutableList<String>> = mutableListOf()
    for (i in 0 until H) {
        val line = input.nextLine()

        val row: MutableList<String> = mutableListOf()
        val charArray: CharArray = line.toCharArray()
        row.add(" ")
        row.addAll(charArray.filterIndexed { index, char -> charArray.size === index + 1 || char !== charArray[index + 1] }.map(Char::toString))
        grid.add(row)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val topLine: MutableList<String> = grid.removeAt(0)
    val bottomLine: MutableList<String> = grid.removeAt(grid.lastIndex)

    for (line in grid.reversed()) {
        line.forEachIndexed { index, char ->
            if (char == "-") {
                val tmp: String = bottomLine[index - 1]
                bottomLine[index - 1] = bottomLine[index + 1]
                bottomLine[index + 1] = tmp
            }
        }
    }

    val results: MutableList<String> = topLine.foldIndexed(mutableListOf<String>()) { index, results, char ->
        if (char != " ") {
            results.add("${char}${bottomLine[index]}")
        }

        results
    }

    // println("answer")
    results.forEach {
        println(it)
    }
}
