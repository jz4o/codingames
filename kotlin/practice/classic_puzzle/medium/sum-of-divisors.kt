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

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val sum: Long = (1..n).fold(0L) { sum, i ->
        sum + (Math.floor(n.toDouble() / i).toLong() * i)
    }

    // println("sum")
    println(sum)
}
