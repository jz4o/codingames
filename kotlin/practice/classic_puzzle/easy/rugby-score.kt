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

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    val TRY_POINT       = 5
    val TRANSFORM_POINT = 2
    val PENA_DROP_POINT = 3

    var combinations = ""

    val possibleTryTimes = N / TRY_POINT
    for (tryTimes in possibleTryTimes downTo 0) {
        val tryPoints = TRY_POINT * tryTimes

        val possibleTransformationTimes = Math.min((N - tryPoints) / TRANSFORM_POINT, tryTimes)
        for (transformationTimes in possibleTransformationTimes downTo 0) {
            val transformPoints = TRANSFORM_POINT * transformationTimes

            val reminingPoints = N - tryPoints - transformPoints
            if (reminingPoints % PENA_DROP_POINT == 0) {
                val penaltieOrDropTimes = reminingPoints / PENA_DROP_POINT
                combinations = "$tryTimes $transformationTimes ${penaltieOrDropTimes}\n$combinations"
            }
        }
    }

    // println("tries transformations penalties")
    println(combinations.trim())
}
