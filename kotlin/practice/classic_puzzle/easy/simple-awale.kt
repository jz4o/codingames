import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val opBowls = input.nextLine()
    val myBowls = input.nextLine()
    val num = input.nextInt()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val BOWLS_SIZE: Int = 7
    val RESERVE_INDEX: Int = BOWLS_SIZE - 1
    val PLAYER_SIZE: Int = 2
    val PLAYER_INDEX_OPP: Int = 0
    val PLAYER_INDEX_MY: Int = 1

    val bowls: List<MutableList<Int>> = arrayListOf(
        opBowls.split(" ").map { it.toInt() }.toMutableList(),
        myBowls.split(" ").map { it.toInt() }.toMutableList()
    )

    var seeds: Int = bowls[PLAYER_INDEX_MY][num]
    bowls[PLAYER_INDEX_MY][num] = 0
    var index: Int = num + 1
    while (seeds > 0) {
        val playerIndex: Int = (Math.floor(index / BOWLS_SIZE.toDouble()).toInt() % PLAYER_SIZE - 1) * -1
        val columnIndex: Int = index % BOWLS_SIZE

        // is enemyStore
        if (playerIndex == PLAYER_INDEX_OPP && columnIndex == RESERVE_INDEX) {
            index++
            continue
        }

        bowls[playerIndex][columnIndex]++

        index++
        seeds--
    }

    // println("answer")
    println(bowls[PLAYER_INDEX_OPP].slice(0..RESERVE_INDEX-1).joinToString(" ") + " [" +  bowls[PLAYER_INDEX_OPP].last() + "]")
    println(bowls[PLAYER_INDEX_MY].slice(0..RESERVE_INDEX-1).joinToString(" ") + " [" +  bowls[PLAYER_INDEX_MY].last() + "]")
    if (index % BOWLS_SIZE == 0) {
        println("REPLAY")
    }
}
