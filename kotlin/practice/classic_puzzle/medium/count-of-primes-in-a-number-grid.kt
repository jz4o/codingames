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
    val C = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: MutableList<List<String>> = mutableListOf()
    for (i in 0 until R) {
        val row = input.nextLine()

        grid.add(row.split(" "))
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val digits: MutableList<Int> = mutableListOf()
    val transposeGrid: List<List<String>> = transpose(grid)

    grid.plus(transposeGrid).forEach { row ->
        for (start in 0 until row.size) {
            for (end in (start + 1)..row.size) {
                val digit: Int = row.subList(start, end).joinToString("").toInt()

                if (!digits.contains(digit)) {
                    digits.add(digit)
                }
            }
        }
    }

    // println("answer")
    val result: Int = digits.filter { isPrime(it) }.size
    println(result)
}

fun isPrime(digit: Int): Boolean =
    digit >= 2 && (2..(digit - 1)).all { digit % it != 0 }

fun <T> transpose(list: List<List<T>>): List<List<T>> =
    list.first().mapIndexed { index, _ ->
        list.map { row -> row[index] }
    }
