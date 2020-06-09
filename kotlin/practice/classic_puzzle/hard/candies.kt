import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val n = input.nextInt()
    val k = input.nextInt()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val results: ArrayList<ArrayList<Int>> = arrayListOf()
    var temps: ArrayList<ArrayList<Int>> = arrayListOf()
    for (i in 1..k) {
        temps.add(arrayListOf(i))
    }

    while (temps.size > 0) {
        val temp: ArrayList<Int> = temps.get(temps.size - 1)
        temps.removeAt(temps.size - 1)

        val tempSum: Int = temp.fold(0) { sum, t -> sum + t }

        if (tempSum == n) {
            results.add(0, temp)
        } else if (tempSum < n) {
            for (i in 1..k) {
                temps.add(ArrayList(temp.plus(i)))
            }
        }
    }

    // println("answer")
    results.forEach { result ->
        println(result.joinToString(" "))
    }
}
