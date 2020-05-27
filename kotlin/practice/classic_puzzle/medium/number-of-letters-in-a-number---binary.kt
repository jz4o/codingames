import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val start = input.nextLong()
    val n = input.nextLong()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var temp: Long = start
    for (i in 0..(n - 1)) {
        val result: Long = temp.toString(2)
                               .replace("0", "zero")
                               .replace("1", "one")
                               .length
                               .toLong()

        if (temp == result) {
            break
        }

        temp = result
    }

    // println("42")
    println(temp)
}
