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
    val integers = ArrayList<Int>()
    for (i in 0 until N) {
        val x = input.nextInt()
        integers.add(x)
    }

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    var totalCost = 0
    while (integers.count() >= 2) {
        integers.sort()

        val firstInt  = integers.removeAt(0)
        val secondInt = integers.removeAt(0)

        val cost = firstInt + secondInt
        totalCost += cost

        integers.add(cost)
    }

    // println("0")
    println(totalCost)
}
