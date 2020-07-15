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
    var stones: MutableList<Int> = mutableListOf()
    for (i in 0 until N) {
        val level = input.nextInt()

        stones.add(level)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var stoneCount: Int = 0
    val levels: MutableList<Int> = stones.distinct().sorted().toMutableList()

    while (levels.size > 0) {
        val level: Int = levels.removeAt(0)
        val targetLevelStones: List<Int> = stones.filter { it == level }
        val nextLevelStoneCount: Int = Math.floor(targetLevelStones.size / 2.0).toInt()
        val targetStoneCount: Int = targetLevelStones.size % 2
        stones = stones.filter { it != level }.toMutableList()

        if (nextLevelStoneCount > 0) {
            val nextLevel: Int = level + 1
            stones.addAll(Array(nextLevelStoneCount) { nextLevel })
            levels.add(0, nextLevel)
        }

        stoneCount += targetStoneCount
    }

    // println("1")
    println(stoneCount)
}
