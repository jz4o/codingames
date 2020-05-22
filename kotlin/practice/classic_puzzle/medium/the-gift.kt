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
    val C = input.nextInt()
    val budgets: ArrayList<Int> = arrayListOf()
    for (i in 0 until N) {
        val B = input.nextInt()

        budgets.add(B)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    if (budgets.sum() < C) {
        println("IMPOSSIBLE")
    } else {
        var lack: Int = C
        budgets.sort()
        while (budgets.size > 0) {
            val average: Int = lack / budgets.size
            val pay: Int = Math.min(budgets.removeAt(0), average)
            lack -= pay
            println(pay)
        }
    }

    // println("IMPOSSIBLE")
}
