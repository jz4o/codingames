import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val n1 = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val DIGITS_SIZE: Int = n1.length
    val answers: MutableList<String> = mutableListOf()

    var temp: String = n1
    while (!answers.contains(temp)) {
        answers.add(temp)

        val biggest: Int = temp.toCharArray().sorted().reversed().joinToString("").toInt()
        val smallest: Int = temp.toCharArray().sorted().joinToString("").toInt()
        val answer: Int = biggest - smallest

        temp = "%0${DIGITS_SIZE}d".format(answer)
    }

    val result: String = answers.subList(answers.indexOf(temp), answers.size).joinToString(" ")

    // println("1 2 3 4")
    println(result)
}
