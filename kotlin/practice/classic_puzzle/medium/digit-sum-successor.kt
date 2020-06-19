import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val N = input.nextLong()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val digits: MutableList<Int> = "0$N".toCharArray().map({ c -> c.toString().toInt() }).toMutableList()

    val decrementIndex: Int = digits.lastIndexOf(digits.findLast({ it > 0 }))
    digits[decrementIndex]--

    val incrementableArray: IntArray = digits.toIntArray().copyOfRange(0, decrementIndex)
    val incrementIndex: Int = incrementableArray.lastIndexOf(incrementableArray.findLast({ it < 9 })!!)
    digits[incrementIndex]++

    val result: Long = (
        digits.toIntArray().copyOfRange(0, incrementIndex + 1).joinToString("")
        + digits.toIntArray().copyOfRange(incrementIndex + 1, digits.size).sorted().joinToString("")
    ).toLong()

    // println("11")
    println(result)
}
