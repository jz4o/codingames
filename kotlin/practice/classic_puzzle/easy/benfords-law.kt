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
    val transactions: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val transaction = input.nextLine()

        transactions.add(transaction)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val benfordLawPercentages: List<Double> = listOf<Double>(0.0, 0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046)
    val firstNumbers: List<Int> = transactions.map { Regex("[1-9]").find(it)!!.value.toInt() }

    val isFraudulent: Boolean = (1..9).any {
        val benfordLawPercentage: Double = benfordLawPercentages.get(it)
        val percent: Double = firstNumbers.count { n -> n == it } / N.toDouble()

        !(percent in (benfordLawPercentage - 0.1)..(benfordLawPercentage + 0.1))
    }

    // println("false")
    println(isFraudulent)
}
