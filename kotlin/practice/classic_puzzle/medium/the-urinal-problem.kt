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
    val B = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var longestSpaceCount:        Int = 0
    var leftIndexInLongestSpace:  Int = 0
    var rightIndexInLongestSpace: Int = 0
    var spaceCount:               Int = 0
    var leftIndexInSpace:         Int = 0
    var rightIndexInSpace:        Int = 0
    for ((index, b) in "$B!".toCharArray().withIndex()) {
        if (b == 'U') {
            if (spaceCount == 0) {
                leftIndexInSpace = index
            }

            spaceCount++
            rightIndexInSpace = index
        } else {
            if (spaceCount > longestSpaceCount) {
                longestSpaceCount = spaceCount
                leftIndexInLongestSpace = leftIndexInSpace
                rightIndexInLongestSpace = rightIndexInSpace
            }

            spaceCount = 0
            leftIndexInSpace = 0
            rightIndexInSpace = 0
        }
    }

    val result: Int = when {
        leftIndexInLongestSpace == 0 -> leftIndexInLongestSpace
        rightIndexInLongestSpace == N - 1 -> rightIndexInLongestSpace
        else -> leftIndexInLongestSpace + Math.floor(longestSpaceCount / 2.0).toInt()
    }

    // println("0")
    println(result)
}
