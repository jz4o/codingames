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
    val xs: ArrayList<Int> = arrayListOf()
    for (i in 0 until n) {
        val x = input.nextInt()

        xs.add(x)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var lIndex: Int = -1
    var rIndex: Int = xs.size
    var turn: Int = 0
    while (lIndex < rIndex) {
        lIndex++
        while (lIndex < xs.size && xs[lIndex] != 0) {
            lIndex++
        }

        rIndex--
        while (rIndex >= 0 && xs[rIndex] != 1) {
            rIndex--
        }

        turn++
    }

    // println("answer")
    println(turn - 1)
}
