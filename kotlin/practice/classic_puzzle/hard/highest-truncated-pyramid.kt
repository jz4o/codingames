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

    var partCount: Int = 1
    var topStepCount: Int = 1
    var bottomStepCount: Int = 1

    while (true) {
        if (partCount < N) {
            bottomStepCount++
            partCount += bottomStepCount
        } else if (N < partCount) {
            partCount -= topStepCount
            topStepCount++
        } else {
            break
        }
    }

    for (i in topStepCount..bottomStepCount) {
        println("*".repeat(i))
    }
}
