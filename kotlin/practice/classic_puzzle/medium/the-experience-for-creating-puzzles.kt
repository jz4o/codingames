import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val level = input.nextInt()
    val xp = input.nextInt()
    val N = input.nextInt()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val EXP_OF_PUZZLE: Int = 300

    val result: BlitzProg = reflectExp(level, EXP_OF_PUZZLE * N, xp)

    // println("answer")
    println(result.level)
    println(result.expToLevelUp)
}

class BlitzProg(val level: Int, val expToLevelUp: Int)

fun reflectExp(currentLevel: Int, exp: Int, levelUpExp: Int? = null): BlitzProg {
    val tempExp = exp - (levelUpExp ?: getExpForLevelUp(currentLevel))

    return when {
        tempExp < 0 -> BlitzProg(currentLevel, tempExp * -1)
        else        -> reflectExp(currentLevel + 1, tempExp)
    }
}

fun getExpForLevelUp(currentLevel: Int): Int =
    Math.floor(currentLevel * Math.sqrt(currentLevel.toDouble()) * 10).toInt()
