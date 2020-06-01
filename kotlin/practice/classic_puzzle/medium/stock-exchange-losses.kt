import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val n = input.nextInt()
    val vs: ArrayList<Int> = arrayListOf()
    for (i in 0 until n) {
        val v = input.nextInt()

        vs.add(v)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var maxDiff: Int = 0
    var minValue: Int? = null
    for (v in vs.reversed()) {
        if (minValue == null || v < minValue) {
            minValue = v
        }

        // diff is zero or minus
        val diff: Int = minValue - v
        if (diff < maxDiff) {
            maxDiff = diff
        }
    }

    // println("answer")
    println(maxDiff)
}
