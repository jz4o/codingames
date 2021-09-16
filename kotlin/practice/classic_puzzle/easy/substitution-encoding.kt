import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val rows = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: MutableList<List<String>> = mutableListOf()
    for (i in 0 until rows) {
        val row = input.nextLine()

        grid.add(row.split(" ").toList())
    }
    val message = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val replaceMap: HashMap<String, String> = hashMapOf()
    grid.forEachIndexed { rowIndex, row ->
        row.forEachIndexed { columnIndex, char ->
            replaceMap.put(char, "$rowIndex$columnIndex")
        }
    }

    val result: String = message.toCharArray()
            .map { char -> replaceMap.get(char.toString()) }
            .joinToString("")

    // println("encode message")
    println(result)
}
