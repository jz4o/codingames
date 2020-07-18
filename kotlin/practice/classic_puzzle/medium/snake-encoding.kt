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
    val X = input.nextInt()
    val charGrid: MutableList<List<Char>> = mutableListOf()
    for (i in 0 until N) {
        val LINE = input.next()

        charGrid.add(LINE.toCharArray().toList())
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    // array to strign
    val transposedCharGrid: List<List<Char>> = transpose(charGrid.toList())
    val transposedCharStr: String = transposedCharGrid.foldIndexed("") { index, result, row ->
        result + (if (index % 2 == 0) row.reversed() else row).joinToString("")
    }

    // rotate char(s)
    val rotateBeginIndex: Int = transposedCharStr.length - X
    val rotateEndIndex: Int = rotateBeginIndex + transposedCharStr.length
    val rotatedTransposedCharStr: String = transposedCharStr.repeat(2).substring(rotateBeginIndex, rotateEndIndex)

    // string to array
    val rotatedTransposedCharGrid: List<List<Char>> =
        Regex(".{${N}}").findAll(rotatedTransposedCharStr)
                        .map { it.value.toCharArray().toList() }
                        .mapIndexed { index, row -> if (index % 2 == 0) row.reversed() else row }
                        .toList()
    val rotatedCharGrid: List<List<Char>> = transpose(rotatedTransposedCharGrid)

    // print answer
    // println("answer")
    for (row in rotatedCharGrid) {
        println(row.joinToString(""))
    }
}

fun <T> transpose(list: List<List<T>>): List<List<T>> =
    list.first().mapIndexed { index, _ ->
        list.map { row -> row[index] }
    }
