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
    val MESSAGE = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    fun decode(text: String): String {
        var tempText: String = text
        var result: String = ""
        var turn: Int = 1

        var sum: Int = turn
        while (sum < tempText.length) {
            turn++
            sum += turn
        }

        while (turn > 0) {
            val sliceSize: Int = tempText.length - (1..(turn - 1)).fold(0) { s, v -> s + v }

            if (turn % 2 == 1) {
                val sliced = tempText.substring(tempText.length-sliceSize)
                result = "$sliced$result"
                tempText = tempText.substring(0, tempText.length-sliceSize)
            } else {
                val sliced = tempText.substring(0, sliceSize)
                result = "$sliced$result"
                tempText = tempText.substring(sliceSize)
            }

            turn--
        }

        return result
    }

    fun encode(text: String): String {
        var tempText: String = text
        var result: String = ""
        var turn: Int = 1

        var target: String = tempText.substring(0, turn)
        tempText = tempText.substring(turn)
        while (target.length != 0) {
            result = if (turn % 2 == 1) "$result$target" else "$target$result"

            turn++

            target = tempText.substring(0, Math.min(turn, tempText.length))
            tempText = tempText.substring(Math.min(turn, tempText.length))
        }

        return result
    }

    var result: String = MESSAGE
    for (i in 0 until Math.abs(N)) {
        result = if (N > 0) decode(result) else encode(result)
    }

    // println("answer")
    println(result)
}
