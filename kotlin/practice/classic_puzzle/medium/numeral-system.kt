import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val equality = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val NUMERALS: CharArray = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray()

    val (x, y, z) = equality.split("[+=]".toRegex())

    val equalityChars: CharArray = equality.toCharArray()
    val maxNumeral: Char = NUMERALS.findLast { equalityChars.contains(it) }!!
    val minumumN: Int = NUMERALS.indexOf(maxNumeral) + 1

    val result: Int = (minumumN..NUMERALS.size).find {
        x.toLong(it) + y.toLong(it) === z.toLong(it)
    }!!

    // println("answer")
    println(result)
}
