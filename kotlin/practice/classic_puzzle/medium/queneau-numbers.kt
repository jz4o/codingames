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

    val INITIAL_ARRAY: List<Int> = (1..N).toList()
    val CENTER_INDEX: Int = Math.floor(N / 2.0).toInt()
    var array: List<Int> = INITIAL_ARRAY
    val progressLog: MutableList<String> = mutableListOf()

    for (i in 0 until N) {
        val frontHalf: List<Int> = array.subList(0, CENTER_INDEX)
        val backHalf: List<Int> = array.subList(CENTER_INDEX, array.size)

        array = backHalf.reversed().foldIndexed(mutableListOf()) { index, result, value ->
            result.add(value)

            if (frontHalf.size > index) {
                result.add(frontHalf[index])
            }

            result
        }

        progressLog.add(array.joinToString(","))
    }

    // println("IMPOSSIBLE")
    if (array == INITIAL_ARRAY) {
        println(progressLog.joinToString("\n"))
    } else {
        println("IMPOSSIBLE")
    }
}
