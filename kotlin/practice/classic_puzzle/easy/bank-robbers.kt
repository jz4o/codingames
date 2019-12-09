import java.util.*
import java.io.*
import java.math.*

import kotlin.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val R = input.nextInt()
    val V = input.nextInt()
    var robbers = IntArray(R) { 0 }
    for (i in 0 until V) {
        val C = input.nextInt()
        val N = input.nextInt()

        val vaultTime: Int = (10f.pow(N) * 5f.pow(C - N)).toInt()
        robbers[robbers.indexOf(robbers.min() ?: 0)] += vaultTime
    }

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    // println("1")
    println(robbers.max())
}
