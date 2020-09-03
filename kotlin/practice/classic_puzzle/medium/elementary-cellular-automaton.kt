import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val R = input.nextInt()
    val N = input.nextInt()
    val startPattern = input.next()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val RULE_LENGTH: Int = 8

    val binaryDigitsR: List<String> = R.toString(2)
        .padStart(RULE_LENGTH, '0')
        .toCharArray()
        .reversed()
        .map(Char::toString)

    val RULE: Map<String, String> = (0 until RULE_LENGTH).map {
        it.toString(2).padStart(3, '0') to binaryDigitsR[it]
    }.toMap()

    val results: MutableList<String> = mutableListOf()
    Array<String>(N) { "" }.fold(startPattern.replace(".", "0").replace("@", "1")) { temp, _ ->
        results.add(temp.replace("0", ".").replace("1", "@"))

        val array: List<String> = listOf(temp.last().toString())
            .plus(temp.toCharArray().map(Char::toString))
            .plus(temp.first().toString())

        (0 until temp.length).map {
            RULE[array.subList(it, it + 3).joinToString("")]
        }.joinToString("")
    }

    // println(".....@.@.....")
    results.forEach {
        println(it)
    }
}
