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
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val input2 = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var temp: String = input2

    val minusFlag: Boolean = input2.contains("-")
    val dotFlag: Boolean = input2.contains(".")
    temp = temp.replace("-", "").replace(".", "").replace("\\s".toRegex(), "")

    val digits: List<Int> = temp.toCharArray().map({ c -> c.toString().toInt() })
    if (minusFlag) {
        temp = digits.sorted().joinToString("")
        temp = if (dotFlag) temp.replace("^${temp[0]}".toRegex(), "${temp[0]}.") else temp
        temp = "-$temp"
        temp = if (Regex("^-0\\.0+$").matches(temp)) "0" else temp
    } else {
        temp = digits.sorted().reversed().joinToString("")

        if (dotFlag) {
            val lastChar: Char = temp[temp.length - 1]
            temp = temp.replace("$lastChar$".toRegex(), ".$lastChar")
        }

        temp = temp.replace(".0", "")
    }

    // println("greatest")
    println(temp)
}
