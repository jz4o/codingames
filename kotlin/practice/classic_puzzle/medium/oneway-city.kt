import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val M = input.nextInt()
    val N = input.nextInt()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val distances: List<Int> = listOf(M - 1, N - 1)
    val minDistance: Int = Math.min(M - 1, N - 1)
    val maxDistance: Int = Math.max(M - 1, N - 1)

    // one way city
    if (minDistance <= 0) {
        println(1)
        return
    }

    val moleCombination: BigInteger = ((maxDistance + 1)..(minDistance + maxDistance)).fold(BigInteger("1")) { mul, distance -> mul.times(BigInteger(distance.toString())) }
    val denoCombination: BigInteger = (1..minDistance).fold(BigInteger("1")) { mul, distance -> mul.times(BigInteger(distance.toString())) }

    val movableCombination: BigInteger = moleCombination.div(denoCombination)
    val movableCombinationStr: String = movableCombination.toString()
    val significantDigits: String = movableCombinationStr.substring(0..(Math.min(999, movableCombinationStr.length - 1)))

    // println("answer")
    println(significantDigits)
}
