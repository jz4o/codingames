import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val w = input.nextInt()
    val h = input.nextInt()
    val countX = input.nextInt()
    val countY = input.nextInt()
    val widthMeasurements: MutableList<Int> = mutableListOf(0);
    for (i in 0 until countX) {
        val x = input.nextInt()

        widthMeasurements.add(x)
    }
    widthMeasurements.add(w)
    val heightMeasurements: MutableList<Int> = mutableListOf(0)
    for (i in 0 until countY) {
        val y = input.nextInt()

        heightMeasurements.add(y)
    }
    heightMeasurements.add(h)

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val widthCounts: MutableMap<Int, Int> = mutableMapOf()
    widthMeasurements.forEachIndexed { index, widthMeasurement ->
        widthMeasurements.take(index).forEach { widthCounts[widthMeasurement - it] = (widthCounts[widthMeasurement - it] ?: 0) + 1 }
    }

    val heightCounts: MutableMap<Int, Int> = mutableMapOf()
    heightMeasurements.forEachIndexed { index, heightMeasurement ->
        heightMeasurements.take(index).forEach { heightCounts[heightMeasurement - it] = (heightCounts[heightMeasurement - it] ?: 0) + 1}
    }

    val result: Int = widthCounts.keys.fold(0) { sum, k -> sum + (widthCounts[k] ?: 0) * (heightCounts[k] ?: 0) }

    // println("0")
    println(result)
}
