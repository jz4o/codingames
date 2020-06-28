import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val intext = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val result: String = intext.toLowerCase()
                               .replace(",", ", ")
                               .replace("\\s+".toRegex(), " ")
                               .split(".")
                               .map { it.trim() }
                               .filter { it != "" }
                               .map { it.first().toUpperCase() + it.substring(1) }
                               .joinToString(". ")
                               .replace(" ,", ",")
                               .replace(",+".toRegex(), ",") +
                               if (intext.endsWith(".")) "." else ""

    // println("solution")
    println(result)
}
