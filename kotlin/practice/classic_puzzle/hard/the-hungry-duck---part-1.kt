import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val W = input.nextInt()
    val H = input.nextInt()
    val foods: Array<IntArray> = Array(H) { IntArray(W) }
    for (i in 0 until H) {
        for (j in 0 until W) {
            val food = input.nextInt()

            foods[i][j] = food
        }
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    for (height in 0 until H) {
        for (width in 0 until W) {
            val top: Int = if (height == 0) 0 else foods[height - 1][width]
            val left: Int = if (width == 0) 0 else foods[height][width - 1]

            foods[height][width] += if (top < left) left else top
        }
    }

    // println("answer")
    println(foods[H - 1][W - 1])
}
