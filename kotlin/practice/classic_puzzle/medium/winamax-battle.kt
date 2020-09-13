import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val CARD_LANKS: List<String> = listOf("2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A")

    val input = Scanner(System.`in`)
    val n = input.nextInt() // the number of cards for player 1
    val deck1: MutableList<Int> = mutableListOf()
    for (i in 0 until n) {
        val cardp1 = input.next() // the n cards of player 1

        val cardLank: String = cardp1.take(cardp1.length - 1)
        deck1.add(CARD_LANKS.indexOf(cardLank))
    }
    val m = input.nextInt() // the number of cards for player 2
    val deck2: MutableList<Int> = mutableListOf()
    for (i in 0 until m) {
        val cardp2 = input.next() // the m cards of player 2

        val cardLank: String = cardp2.take(cardp2.length - 1)
        deck2.add(CARD_LANKS.indexOf(cardLank))
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var result: String
    try {
        var turn: Int = 0
        while (deck1.size > 0 && deck2.size > 0) {
            turn++

            val fightResult: FightResult = fight(deck1, deck2)

            val moveCards: List<Int> = listOf(
                deck1.take(fightResult.index + 1),
                deck2.take(fightResult.index + 1)
            ).flatten()
            for (i in 0 until (fightResult.index + 1)) {
                deck1.removeAt(0)
                deck2.removeAt(0)
            }

            if (fightResult.winner == "deck1") {
                deck1.addAll(moveCards)
            } else {
                deck2.addAll(moveCards)
            }
        }

        val winner: Int = if (deck1.size > 0) 1 else 2
        result = "${winner} ${turn}"
    } catch (e: Exception) {
        result = "PAT"
    }

    // println("PAT")
    println(result)
}

class FightResult(val winner: String, val index: Int)

fun fight(deck1: MutableList<Int>, deck2: MutableList<Int>, index: Int = 0): FightResult {
    val deck1Card: Int? = deck1[index]
    val deck2Card: Int? = deck2[index]

    if (deck1Card == null || deck2Card == null) {
        throw Exception()
    }

    if (deck1Card == deck2Card) {
        return fight(deck1, deck2, index + 4)
    }

    val winner = if (deck1Card < deck2Card) "deck2" else "deck1"

    return FightResult(winner, index)
}

