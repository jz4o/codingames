import java.util.*
import java.io.*
import java.math.*

import java.time.LocalDate
import java.time.temporal.ChronoUnit

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val BEGIN = input.next()
    val END = input.next()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val (beginDay, beginMonth, beginYear) = BEGIN.split(".")
    val (endDay, endMonth, endYear) = END.split(".")

    val beginDate: LocalDate = LocalDate.parse("${beginYear}-${beginMonth}-${beginDay}")
    val endDate: LocalDate = LocalDate.parse("${endYear}-${endMonth}-${endDay}")

    val beginMonths: Int = beginDate.getYear() * 12 + beginDate.getMonthValue()
    val endMonths: Int = endDate.getYear() * 12 + endDate.getMonthValue()

    val year: Int = Math.floor((endMonths - beginMonths) / 12.0).toInt()
    val month: Int = ((endMonths - beginMonths) % 12) - (if (endDate.getDayOfMonth() < beginDate.getDayOfMonth()) 1 else 0)
    val days: Int = ChronoUnit.DAYS.between(beginDate, endDate).toInt()

    val formattedYear: String? =
        when (year) {
            0 -> null
            1 -> "${year} year"
            else -> "${year} years"
        }

    val formattedMonth: String? =
        when (month) {
            0 -> null
            1 -> "${month} month"
            else -> "${month} months"
        }

    val formattedDays: String = "total ${days} days"

    val result: String = listOf(formattedYear, formattedMonth, formattedDays).filter { it != null }.joinToString(", ")

    // println("YY year[s], MM month[s], total NN days")
    println(result)
}
