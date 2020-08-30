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
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val T = input.nextLine()
    val rows: ArrayList<String> = arrayListOf()
    for (i in 0 until H) {
        val ROW = input.nextLine()

        rows.add(ROW)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val ALPHAS: CharArray = "ABCDEFGHIJKLMNOPQRSTUVWXYZ?".toCharArray()
    val result: Array<String> = Array(H) { "" }

    for (t in T.toUpperCase().toCharArray()) {
        var alphaIndex: Int = ALPHAS.indexOf(t)
        alphaIndex = if (alphaIndex >= 0) alphaIndex else ALPHAS.size - 1

        for (h in 0 until H) {
            result[h] += rows[h].substring(L * alphaIndex, L * alphaIndex + L)
        }
    }

    // println("answer")
    for (row in result) {
        println(row)
    }
}
