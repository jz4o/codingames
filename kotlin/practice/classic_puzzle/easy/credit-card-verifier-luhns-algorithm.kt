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
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val cards: Array<String?> = arrayOfNulls(n)
    for (i in 0 until n) {
        val card = input.nextLine()
        cards[i] = card
    }

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    // println("YES or NO")
    for (card in cards) {
        if (card == null) {
            continue
        }

        println(if (isValidCard(card)) "YES" else "NO")
    }
}

fun isValidCard(argCard: String): Boolean {
    val card = argCard.replace(" ", "")

    var sum= 0
    for (i in 0..(card.length - 1)) {
        var number = card[i].toString().toInt()

        if (i % 2 == 0) {
            number *= 2
            if (number >= 10) {
                number -= 9
            }
        }

        sum += number
    }

    return sum % 10 == 0
}
