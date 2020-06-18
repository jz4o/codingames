import java.util.*
import java.io.*
import java.math.*

/**
 * Don't let the machines win. You are humanity's last hope...
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val width = input.nextInt() // the number of cells on the X axis
    val height = input.nextInt() // the number of cells on the Y axis
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: ArrayList<ArrayList<String>> = arrayListOf()
    for (i in 0 until height) {
        val line = input.nextLine() // width characters, each either 0 or .

        grid.add(ArrayList(line.toCharArray().map({c -> c.toString()})))
    }

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    val results: ArrayList<String> = arrayListOf()
    for (h in 0 until height) {
        for (w in 0 until width) {
            if (grid[h][w] == ".") {
                continue
            }

            val currentNode: String = "$w $h"

            val rightIndex: Int? = ((w + 1)..(width - 1)).find({ r -> grid[h][r] == "0" })
            val rightNode: String = if (rightIndex != null) "$rightIndex $h" else "-1 -1"

            val bottomIndex: Int? = ((h + 1)..(height - 1)).find({ b -> grid[b][w] == "0" })
            val bottomNode: String = if (bottomIndex != null) "$w $bottomIndex" else "-1 -1"

            results.add("$currentNode $rightNode $bottomNode")
        }
    }

    // Three coordinates: a node, its right neighbor, its bottom neighbor
    // println("0 0 1 0 0 1")
    for (result in results) {
        println(result)
    }
}
