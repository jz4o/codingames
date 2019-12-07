import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val n = input.nextInt() // the number of temperatures to analyse
    var ns: Array<Int?> = arrayOfNulls(n)
    for (i in 0 until n) {
        val t = input.nextInt() // a temperature expressed as an integer ranging from -273 to 5526
        ns[i] = t
    }

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    var closestZeroNegative: Int? = null
    var closestZeroPositive: Int? = null
    for (n in ns) {
        System.err.println(n)

        n ?: continue

        if (n == 0) {
            closestZeroNegative = n
            closestZeroPositive = n
        } else if ((closestZeroNegative ?: -273) <= n && n < 0) {
            closestZeroNegative = n
        } else if (0 < n && n <= (closestZeroPositive ?: 5526)) {
            closestZeroPositive = n
        }
    }

    var npBalance = 0
    if (closestZeroNegative != null) { npBalance += closestZeroNegative }
    if (closestZeroPositive != null) { npBalance += closestZeroPositive }

    var result: Int? = null
    if (n == 0) {
        result = 0
    } else if (closestZeroPositive == null || closestZeroNegative == null) {
        result = npBalance
    } else if (npBalance <= 0) {
        result = closestZeroPositive
    } else {
        result = closestZeroNegative
    }

    // println("result")
    println(result)
}
