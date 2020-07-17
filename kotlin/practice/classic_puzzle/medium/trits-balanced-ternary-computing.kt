import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val lhs = input.nextLine()
    val op = input.nextLine()
    val rhs = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val decimalLhs: Int = balanceToDecimal(lhs)
    val decimalRhs: Int = balanceToDecimal(rhs)

    val resultDecimal: Int = when(op) {
        "+"  -> decimalLhs + decimalRhs
        "-"  -> decimalLhs - decimalRhs
        "*"  -> decimalLhs * decimalRhs
        "<<" -> decimalLhs * Math.pow(BASE_NUMBER.toDouble(), decimalRhs.toDouble()).toInt()
        ">>" -> Math.floor(decimalLhs.toDouble() / Math.pow(BASE_NUMBER.toDouble(), decimalRhs.toDouble()).toInt()).toInt()
        else -> 0
    }

    val resultBalance: String = decimalToBalance(resultDecimal)

    // println("11T")
    println(resultBalance)
}

val BASE_NUMBER = 3

fun balanceToDecimal(balance: String): Int =
    balance.toCharArray().reversed().foldIndexed(0) { index, sum, b ->
        sum + (if (b == 'T') -1 else b.toString().toInt()) * Math.pow(BASE_NUMBER.toDouble(), index.toDouble()).toInt()
    }

fun decimalToBalance(decimal: Int): String {
    var tempDecimal: Int = decimal

    val digits: MutableList<String> = mutableListOf()
    while (tempDecimal != 0) {
        var mod: String = (tempDecimal % BASE_NUMBER).toString()
        tempDecimal = Math.floor(tempDecimal.toDouble() / BASE_NUMBER.toDouble()).toInt()

        if (mod == (BASE_NUMBER - 1).toString()) {
            mod = "T"
            tempDecimal++
        }

        digits.add(0, mod)
    }

    return if (digits.size == 0) "0" else digits.joinToString("")
}
