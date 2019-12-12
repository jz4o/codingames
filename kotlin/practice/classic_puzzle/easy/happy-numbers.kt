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
    if (input.hasNextLine()) {
        input.nextLine()
    }
    var xs = Array(N) { "" }
    for (i in 0 until N) {
        val x = input.nextLine()
        xs[i] = x
    }

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    val HAPPY_NUMBER = "1"
    val HAPPY_FACE   = ":)"
    val UNHAPPY_FACE = ":("

    var results = Array(N) { "" }
    for (i in 0..(N - 1)) {
        var temp = xs[i]

        var exitNumbers = ArrayList<String>()
        exitNumbers.add(HAPPY_NUMBER)

        while (!exitNumbers.contains(temp)) {
            exitNumbers.add(temp)

            var sum = 0
            for (digitStr in temp.toCharArray()) {
                val digit = digitStr.toString().toInt()
                sum += digit * digit
            }

            temp = sum.toString()
        }
        val resultFace = if (temp.equals(HAPPY_NUMBER)) HAPPY_FACE else UNHAPPY_FACE

        results[i] = "${xs[i]} $resultFace"
    }

    // println("23 :)")
    for (result in results) {
        println(result)
    }
}
