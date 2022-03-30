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

    var stage: Int = 0
    var glassCount: Int = 0
    do  {
        glassCount += ++stage
    } while (glassCount + stage + 1 <= N)

    val GLASS_PARTS: Array<String> = arrayOf(
        " *** ",
        " * * ",
        " * * ",
        "*****"
    )

    val WIDTH: Int = stage * GLASS_PARTS.first().length + stage - 1

    val results: MutableList<String> = mutableListOf()
    (1..stage).forEach { step ->
        GLASS_PARTS.forEach { glassPart ->
            val result: String = Array<String>(step, { glassPart }).joinToString(" ")
            val leftSpace: String = " ".repeat(Math.floor((WIDTH - result.length).toDouble() / 2.0).toInt())
            val rightSpace: String = " ".repeat(WIDTH - result.length - leftSpace.length)

            results.add("$leftSpace$result$rightSpace")
        }
    }

    // println("answer")
    results.forEach {
        println(it)
    }
}
