import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val a = input.nextInt()
    val b = input.nextInt()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var high: Int = Math.max(a, b)
    var low: Int = Math.min(a, b)

    val results: MutableList<String> = mutableListOf()

    results.add("${high} * ${low}")

    var addNums: String = ""
    while (low !== 0) {
        if (low % 2 === 0) {
            high = high * 2
            low = Math.floor(low / 2.0).toInt()
        } else {
            addNums += " + ${high}"
            low--
        }

        results.add("= ${high} * ${low}${addNums}")
    }

    results.add("= ${a * b}")

    // println("answer")
    results.forEach {
        println(it)
    }
}
