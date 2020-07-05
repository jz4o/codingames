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
    val ms: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val M = input.nextLine()

        ms.add(M)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val MONTHS: Array<String> = arrayOf("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
    val NUMS: Array<String> = arrayOf("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b")

    fun monthlyToNumber(monthlyStr: String): Int {
        return Regex(""".{3}""").findAll(monthlyStr)
                                .map { it.value }
                                .toList()
                                .reversed()
                                .foldIndexed(0) { index, sum, month ->
                                    val base: Int = Math.pow(NUMS.size.toDouble(), index.toDouble()).toInt()
                                    val monthNum: Int = NUMS[MONTHS.indexOf(month)].toInt(NUMS.size)

                                    sum + (monthNum * base)
                                }
    }

    fun numberToMonthly(num: Int): String {
        val monthlies: List<String> = num.toString(NUMS.size).toCharArray().map {
            MONTHS[NUMS.indexOf(it.toString())]
        }

        return monthlies.joinToString("")
    }

    val sum: Int = ms.fold(0) { sum, m -> sum + monthlyToNumber(m) }
    val result: String = numberToMonthly(sum)

    // println("answer")
    println(result)
}
