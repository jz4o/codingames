import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val sequence = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val depths: HashMap<Char, ArrayList<Int>> = hashMapOf()
    var depth: Int = 0
    val sequenceChars: ArrayList<Char> = sequence.toCharArray().toCollection(ArrayList())
    while (sequenceChars.size > 0) {
        val char: Char = sequenceChars.removeAt(0)

        if (char == '-') {
            val closeChar = sequenceChars.removeAt(0)

            if (!depths.containsKey(closeChar)) {
                depths[closeChar] = arrayListOf()
            }
            depths.put(closeChar, depths[closeChar]!!.plus(depth).toCollection(ArrayList()))

            depth--
        } else {
            depth++
        }
    }

    var maximumValueKey: Char = ' '
    var maximumValue: Double = 0.0
    depths.forEach { (key, value) ->
        val sum: Double = value.fold(0.0) { sum, keyDepth -> sum + 1.0 / keyDepth }

        if (maximumValue < sum) {
            maximumValueKey = key
            maximumValue = sum
        }
    }

    // println("answer")
    println(maximumValueKey)
}
