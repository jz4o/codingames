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

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val cubeCount: Int = Math.pow(N.toDouble(), 3.0).toInt()
    val invisibleCubeWidth: Int = Math.max(N - 2, 0)
    val invisibleCubeCount: Int = Math.pow(invisibleCubeWidth.toDouble(), 3.0).toInt()

    // println("answer")
    println(cubeCount - invisibleCubeCount)
}
