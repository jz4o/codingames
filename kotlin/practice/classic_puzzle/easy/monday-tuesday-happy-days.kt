import java.util.*
import java.io.*
import java.math.*

import java.time.format.DateTimeFormatter
import java.time.LocalDate
import java.time.temporal.ChronoUnit

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val leapYear = input.nextInt()
    val sourceDayOfWeek = input.next()
    val sourceMonth = input.next()
    val sourceDayOfMonth = input.nextInt()
    val targetMonth = input.next()
    val targetDayOfMonth = input.nextInt()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val DAY_OF_WEEK: List<String> = listOf("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

    // year is 0001 if leap is 0
    // LocalDate.parse("0000-01-01").isLeapYear() // => true
    //
    // year is 0000 if leap is 1
    // LocalDate.parse("0001-01-01").isLeapYear() // => false
    val year: String = "%04d".format(leapYear * -1 + 1)

    val formatter: DateTimeFormatter = DateTimeFormatter.ofPattern("uuuu MMM d")
    val targetDate: LocalDate = LocalDate.parse("${year} ${targetMonth} ${targetDayOfMonth}", formatter)
    val sourceDate: LocalDate = LocalDate.parse("${year} ${sourceMonth} ${sourceDayOfMonth}", formatter)

    val days: Int = ChronoUnit.DAYS.between(sourceDate, targetDate).toInt()
    val sourceDayOfWeekIndex: Int = DAY_OF_WEEK.indexOf(sourceDayOfWeek)
    val targetDayOfWeekIndex: Int = (days + sourceDayOfWeekIndex + (Math.abs(days) * DAY_OF_WEEK.size)) % DAY_OF_WEEK.size

    // println("day of week")
    println(DAY_OF_WEEK[targetDayOfWeekIndex])
}
