import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val L = input.nextInt()
    val H = input.nextInt()
    val transposeAsciiMayans: MutableList<List<String>> = mutableListOf()
    for (i in 0 until H) {
        val numeral = input.next()

        transposeAsciiMayans.add(numeral.chunked(L))
    }
    val mayans1: MutableList<String> = mutableListOf()
    val S1 = input.nextInt()
    for (i in 0 until S1) {
        val num1Line = input.next()

        mayans1.add(num1Line)
    }
    val mayans2: MutableList<String> = mutableListOf()
    val S2 = input.nextInt()
    for (i in 0 until S2) {
        val num2Line = input.next()

        mayans2.add(num2Line)
    }
    val operation = input.next()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    Mayan.h = H
    Mayan.l = L
    Mayan.asciiMayans = transpose(transposeAsciiMayans).map { it.joinToString("") }

    val num1: Long = Mayan.toNum(mayans1)
    val num2: Long = Mayan.toNum(mayans2)

    val result: Long = when (operation) {
        "+" -> num1 + num2
        "-" -> num1 - num2
        "*" -> num1 * num2
        "/" -> num1 / num2
        else -> 0L
    }

    val results: List<String> = Mayan.fromNum(result)

    // println("result")
    results.forEach {
        println(it)
    }
}

fun <T> transpose(list: List<List<T>>): List<List<T>> =
    list.first().mapIndexed { index, _ ->
        list.map { row -> row[index] }
    }

class Mayan {
    companion object {
        var h: Int = 0
        var l: Int = 0
        var asciiMayans: List<String> = listOf()

        fun toNum(mayans: List<String>): Long {
            val mayanIndexes: List<Int> = mayans.chunked(h).map { mayan ->
                asciiMayans.indexOf(mayan.joinToString(""))
            }.reversed()

            val num: Long = mayanIndexes.foldIndexed(0L) { index, sum, mayanIndex ->
                val radix: Int = Math.pow(asciiMayans.size.toDouble(), index.toDouble()).toInt()
                sum + radix * mayanIndex
            }

            return num
        }

        fun fromNum(num: Long): List<String> =
            num.toString(asciiMayans.size).toCharArray().map(Char::toString).fold(mutableListOf()) { results, char ->
                val mayan: String = asciiMayans[char.toInt(asciiMayans.size)]
                results.addAll(mayan.chunked(l))

                results
            }
    }
}
