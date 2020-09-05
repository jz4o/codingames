import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val ENCRYPT = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val binaries: List<String?> = ENCRYPT.split(" ").chunked(2).map {
        val binary: String = it.first()
        val count: Int = if (it.size >= 2) it.last().length else 0

        if (!listOf("0", "00").contains(binary) || count == 0) {
            null
        } else {
            (if (binary == "0") "1" else "0").repeat(count)
        }
    }
    val validFlag: Boolean = !binaries.contains(null)

    val binariesStr: String = binaries.joinToString("")
    val result: String =
        if (validFlag && binariesStr.length % 7 == 0) {
            // -> 7bit binary -> code point -> each char -> result string
            binariesStr.chunked(7).map { it.toInt(2) }.map(Int::toChar).joinToString("")
        } else {
            "INVALID"
        }

    // println("INVALID")
    println(result)
}
