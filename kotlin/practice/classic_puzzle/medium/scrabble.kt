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
    val words: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val W = input.nextLine()

        words.add(W)
    }
    val LETTERS = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val POINTS: HashMap<Char, Int> = hashMapOf()
    "eaionrtlsu".toCharArray().forEach { POINTS[it] = 1 }
    "dg".toCharArray().forEach { POINTS[it] = 2 }
    "bcmp".toCharArray().forEach { POINTS[it] = 3 }
    "fhvwy".toCharArray().forEach { POINTS[it] = 4 }
    "k".toCharArray().forEach { POINTS[it] = 5 }
    "jx".toCharArray().forEach { POINTS[it] = 8 }
    "qz".toCharArray().forEach { POINTS[it] = 10 }

    val results: List<Result> = words.map { word ->
        val point: Int = word.toCharArray().map { POINTS[it] ?: 0 }.sum()

        var chars: String = String(LETTERS.toCharArray())
        val buildable: Boolean = word.toCharArray().all { w ->
            val contains = chars.contains(w)
            chars = chars.replaceFirst(w.toString(), "")

            contains
        }

        Result(word, if (buildable) point else 0)
    }

     val result: Result = results.reduce { l, r -> if (l.point < r.point) r else l }

    // println("invalid word")
    println(result.word)
}

class Result(val word: String, val point: Int)
