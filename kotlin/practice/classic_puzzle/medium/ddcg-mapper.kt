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
    val N = input.nextInt()
    val patterns: MutableList<Int> = mutableListOf()
    val tempos: MutableList<Int> = mutableListOf()
    for (i in 0 until N) {
        val pattern = input.next()
        val tempo = input.nextInt()

        patterns.add(pattern.replace("X", "1").toInt(2))
        tempos.add(tempo)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val results: MutableList<String> = mutableListOf()
    for (l in 1..L) {
        val resultNumber: Int = tempos.foldIndexed(0) { index, result, tempo ->
            if (l % tempo == 0) result or patterns[index] else result
        }

        val result: String = String.format("%04d", resultNumber.toString(2).toInt()).replace("1", "X")
        results.add(0, result)
    }

    // println("answer")
    for (result in results) {
        println(result)
    }
}
