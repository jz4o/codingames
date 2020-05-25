import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val ROUNDS = input.nextInt()
    val CASH = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val plays: Array<String?> = arrayOfNulls(ROUNDS)
    for (i in 0 until ROUNDS) {
        val PLAY = input.nextLine()
        plays[i] = PLAY
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var result: Int = CASH
    plays.forEach { play ->
        val bet: Int = Math.ceil(result / 4.0).toInt()
        result -= bet

        val playElements: List<String> = play!!.split(" ")
        val ball: Int = playElements[0].toInt()
        val call: String = playElements[1]
        val number: Int? = if (playElements.size < 3) null else playElements[2].toInt()

        result += when (call) {
            "PLAIN" -> if (ball == number) bet * 36 else 0
            "ODD"   -> if (ball % 2 == 1) bet * 2 else 0
            "EVEN"  -> if (ball % 2 == 0 && ball > 0) bet * 2 else 0
            else    -> 0
        }
    }

    // println("cash of the target after playing")
    println(result)
}
