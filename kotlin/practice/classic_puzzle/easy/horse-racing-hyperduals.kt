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
    val N = input.nextInt()
    val strengths: ArrayList<Strength> = arrayListOf()
    for (i in 0 until N) {
        val V = input.nextInt()
        val E = input.nextInt()

        strengths.add(Strength(V, E))
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val results: ArrayList<Int> = arrayListOf()
    for ((lIndex, left) in strengths.withIndex()) {
        for ((rIndex, right) in strengths.withIndex()) {
            if (rIndex <= lIndex) {
                continue
            }

            results.add(abs(right.v - left.v) + abs(right.e - left.e))
        }
    }

    // println("42")
    val result: Int = results.reduce { min, result -> min(min, result) }
    println(result)
}

class Strength(val v: Int, val e: Int)
