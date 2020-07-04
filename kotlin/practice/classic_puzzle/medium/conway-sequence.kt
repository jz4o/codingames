import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val R = input.nextInt()
    val L = input.nextInt()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val result: MutableList<Int> = mutableListOf(R)

    for (i in 0 until L - 1) {
        var temp: List<Int> = result.toList()
        result.removeAll { true }

        while (temp.size > 0) {
            val firstElement: Int = temp.first()
            val anotherElement: Int? = temp.find { it != firstElement }
            val deleteSize: Int = if (anotherElement != null) temp.indexOf(anotherElement) else temp.size

            result.add(deleteSize)
            result.add(firstElement)
            temp = temp.drop(deleteSize)
        }
    }

    // println("answer")
    println(result.joinToString(" "))
}
