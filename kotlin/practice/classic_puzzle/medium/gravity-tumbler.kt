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
    val count = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val rasters: MutableList<List<String>> = mutableListOf()
    for (i in 0 until height) {
        val raster = input.nextLine()

        rasters.add(raster.toCharArray().map { it.toString() })
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    fun <T> transpose(list: List<List<T>>): List<List<T>> = list.first().mapIndexed { i, _ -> list.map { it[i] } }

    var result: List<List<String>> = rasters
    for (i in 0 until count) {
        result = transpose(result.map { it.sorted() }).reversed()
    }

    // println("...")
    // println("write ###")
    for (line in result) {
        println(line.joinToString(""))
    }
}
