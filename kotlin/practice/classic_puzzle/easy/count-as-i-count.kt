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

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val TARGET_SCORE: Int = 50
    val POSSIBLE_ROUNDS: Int = 4

    var result: Int = 0
    val patterns: HashMap<String, Pattern> = hashMapOf()
    patterns[n.toString()] = Pattern(listOf(n), 1, n)

    val pointNumbers: List<Int> = listOf(listOf(1), (2..12), (2..12)).flatten()

    while (patterns.size > 0) {
        val entry: MutableMap.MutableEntry<String, Pattern> = patterns.entries.first()
        val key: String = entry.key
        val pattern: Pattern = entry.value

        patterns.remove(key)

        pointNumbers.forEach {
            val newNumberList: List<Int> = pattern.numbers.plus(it)
            val newNumbers: String = newNumberList.sorted().joinToString(" ")

            if (patterns.containsKey(newNumbers)) {
                patterns[newNumbers]!!.count += pattern.count
            } else {
                patterns[newNumbers] = Pattern(newNumberList, pattern.count, pattern.score + it)
            }
        }

        patterns.keys.toList().forEach { k ->
            val v = patterns[k]!!

            if (v.score > TARGET_SCORE || v.numbers.size > POSSIBLE_ROUNDS + 1) {
                patterns.remove(k)
            } else if (v.score == TARGET_SCORE) {
                result += v.count
                patterns.remove(k)
            }
        }
    }

    // println("answer")
    println(result)
}

class Pattern(val numbers: List<Int>, var count: Int, val score: Int)

