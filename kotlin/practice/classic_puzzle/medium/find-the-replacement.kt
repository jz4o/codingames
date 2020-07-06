import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val X = input.nextLine()
    val Y = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val xChars: CharArray = X.toCharArray()
    val yChars: CharArray = Y.toCharArray()

    val replaceMap: LinkedHashMap<Char, Char> = linkedMapOf()
    for (i in 0 until xChars.size) {
        if (xChars[i] != yChars[i]) {
            replaceMap[xChars[i]] = yChars[i]
        }
    }

    val replaced: String = xChars.map { replaceMap[it] ?: it }.joinToString("")

    // println("anwser")
    when {
        X == Y        -> println("NONE")
        replaced == Y -> for ((k, v) in replaceMap) println("${k}->${v}")
        else          -> println("CAN'T")
    }
}
