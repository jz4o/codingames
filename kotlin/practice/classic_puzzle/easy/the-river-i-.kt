import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    var r1 = input.nextLong()
    var r2 = input.nextLong()

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    while (r1 != r2) {
        if (r1 < r2) {
            r1 += sumDigits(r1)
        } else {
            r2 += sumDigits(r2)
        }
    }

    // println("42")
    println(r1)
}

fun sumDigits(num: Long) : Long {
    var sum: Long = 0

    for (c in num.toString().toCharArray()) {
        sum += c.toString().toInt()
    }

    return sum
}
