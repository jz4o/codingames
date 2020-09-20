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
    val ts: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val t = input.next()

        ts.add(t)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val fastest: String? = ts.min()

    // println("answer")
    println(fastest)
}

