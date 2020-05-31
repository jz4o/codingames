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

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val width: Int = N * 4 - 1

    var upperPart: String = ""
    var lowerPart: String = ""
    for (i in 1..N) {
        val part: String = "*".repeat(i * 2 - 1)

        val upperLeftSpacePart: String = " ".repeat((width - part.length) / 2)
        upperPart += upperLeftSpacePart + part + "\n"

        val lowerSpacePart: String = " ".repeat((N - i + 1) * 2 - 1)
        val lowerLine: String = part + lowerSpacePart + part
        val lowerLeftSpacePart: String = " ".repeat((width - lowerLine.length) / 2)
        lowerPart += lowerLeftSpacePart + lowerLine + "\n"
    }

    val result: String = upperPart.replace("^\\s".toRegex(), ".") + lowerPart

    // println("answer")
    print(result)
}
