import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val H = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: MutableList<CharArray> = mutableListOf()
    for (i in 0 until H) {
        val S = input.nextLine()

        grid.add(S.toCharArray())
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val LEFT_PART: Char = '/'
    val RIGHT_PART: Char = '\\'
    val PART_EMPTY: Char = '.'

    val result: Boolean = (0..(H - 1)).all { height ->
        val isBottomRow: Boolean = height == H - 1

        (0..(H * 2 - 1)).all { width ->
            val card: Char = grid[height][width]

            if (card == PART_EMPTY) {
                true
            } else {
                val isRightPart: Boolean = card == RIGHT_PART
                val sideCard: Char = if (isRightPart) grid[height][width - 1] else grid[height][width + 1]
                val partnerPart: Char = if (isRightPart) LEFT_PART else RIGHT_PART

                val checkSideCard: Boolean = sideCard == partnerPart
                val checkUnderCard: Boolean = isBottomRow || grid[height + 1][width] == partnerPart

                checkSideCard && checkUnderCard
            }
        }
    }

    // println("UNSTABLE")
    println(if (result) "STABLE" else "UNSTABLE")
}
