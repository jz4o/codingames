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

    val BASE_NUM: Int = 3

    val reverseResult: MutableList<Int> = mutableListOf()
    Math.abs(N).toString(BASE_NUM).toCharArray().reversed().forEachIndexed { index, n ->
        if (reverseResult.size <= index) {
            reverseResult.add(0)
        }
        reverseResult[index] = reverseResult[index] + n.toString().toInt()

        // carry up
        if (BASE_NUM - 1 <= reverseResult[index]) {
            reverseResult[index] -= BASE_NUM
            if (reverseResult.size <= index + 1) {
                reverseResult.add(0)
            }
            reverseResult[index + 1] = 1
        }
    }

    val result: String = reverseResult.reversed()
                                      .map { if (N < 0) -it else it }
                                      .map { if (it < 0) "T" else it.toString() }
                                      .joinToString("")

    // println("42")
    println(result)
}
