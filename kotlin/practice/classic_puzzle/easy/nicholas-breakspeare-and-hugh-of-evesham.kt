import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val n = input.nextInt()
    val numbers: ArrayList<String> = arrayListOf()
    for (i in 0 until n) {
        val x = input.next()

        numbers.add(x)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val results: List<String> = numbers.map { howToRead(it) }

    results.forEach {
        println(it)
    }
}

fun howToRead(numberStr: String): String {
    if (numberStr.substring(0, 1) == "-") {
        return "negative " + howToRead(numberStr.substring(1))
    }

    if (numberStr.length >= 4) {
        val overThousandUnitNames: List<String> = listOf("", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion")

        val numberSize: Int = numberStr.length
        val unitNumberSize: Int = if (numberSize % 3 != 0) numberSize % 3 else 3

        val modNumberSize: Int = numberSize - unitNumberSize

        val unitNumber: String = numberStr.substring(0, unitNumberSize)
        val modNumber: String = numberStr.substring(unitNumberSize)

        var result: String = ""
        result += howToRead(unitNumber) + " " + overThousandUnitNames[modNumberSize / 3]
        if (!Regex("^0+$").matches(modNumber)) {
            result += " " + howToRead(modNumber)
        }

        return result
    }

    var result: String = ""
    val number: Int = numberStr.toInt()
    if (number >= 100) {
        val hundredUnit: Int = number / 100
        val modUnit: Int = number % 100

        if (hundredUnit > 0) {
            result += howToRead(hundredUnit.toString(10)) + " hundred"
        }
        if (modUnit > 0) {
            result += " " + howToRead(modUnit.toString(10))
        }
    } else if (number >= 20) {
        val tenUnitNames: List<String> = listOf("", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety")
        val tenUnit: Int = number / 10
        val modUnit: Int = number % 10

        if (tenUnit > 0) {
            result += tenUnitNames[tenUnit]
        }
        if (modUnit > 0) {
            result += "-" + howToRead(modUnit.toString(10))
        }
    } else {
        val underTwentyNames: List<String> = listOf(
            "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
            "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
        )

        result = underTwentyNames[number]
    }

    return result
}
