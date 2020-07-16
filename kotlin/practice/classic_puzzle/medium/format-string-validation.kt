import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val text = input.nextLine()
    val format = input.nextLine()

    val regexpFormat: String = format.replace("\\", "\\\\")
                                     .replace("^", "\\^")
                                     .replace("*", "\\*")
                                     .replace("(", "\\(")
                                     .replace(")", "\\)")
                                     .replace("[", "\\[")
                                     .replace("]", "\\]")
                                     .replace("{", "\\{")
                                     .replace("}", "\\")
                                     .replace("$", "\\$")
                                     .replace("|", "\\|")
                                     .replace("?", ".")
                                     .replace("~", ".*")

    println(if (regexpFormat.toRegex().matches(text)) "MATCH" else "FAIL")
}
