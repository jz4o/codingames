import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val NUMBER = input.nextLine()
    val numbers: List<Int> = NUMBER.split(" ").map(String::toInt)
    val nbanswer: Int = 36
    baseLoop@ for (base in 0 until nbanswer) {

        // Write an answer using println()
        // To debug: System.err.println("Debug messages...");

        for (i in numbers) {
            if (base <= i) {
                continue@baseLoop
            }
        }

        val baseNumber = numbers.fold("") { baseNumber, i ->
            baseNumber + i.toString(base)
        }

        val decimalNumber: String = BigInteger(baseNumber, base).toString()

        for (i in (1..decimalNumber.length)) {
            val decimal: BigInteger = BigInteger(decimalNumber.substring(0, i))
            if (decimal.mod(BigInteger(i.toString())).toInt() != 0) {
                continue@baseLoop
            }
        }

        // println("value")
        println(base)
    }
}
