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
    val pis: Array<Int?> = arrayOfNulls(N)
    for (i in 0 until N) {
        val pi = input.nextInt()

        pis[i] = pi
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var minimumDiff: Int = 10000000 - 0
    pis.sort()
    for (i in 0..(pis.size - 2)) {
        val diff: Int = pis[i + 1]!!.minus(pis[i]!!)
        if (diff < minimumDiff) {
            minimumDiff = diff
        }
    }

    // println("answer")
    println(minimumDiff)
}
