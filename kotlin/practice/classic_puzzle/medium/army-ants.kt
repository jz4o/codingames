import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val N1 = input.nextInt()
    val N2 = input.nextInt()
    val S1 = input.next()
    val S2 = input.next()
    val T = input.nextInt()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val s1MovePart: MutableList<Char?> = S1.toCharArray().take(T).reversed().toMutableList()
    val s2MovePart: MutableList<Char?> = S2.toCharArray().take(T).toMutableList()

    for (i in 0 until T - s1MovePart.size) {
        s1MovePart.add(0, null)
    }
    for (i in 0 until T - s2MovePart.size) {
        s2MovePart.add(null)
    }

    val s1NotMovePart: String = S1.toCharArray().slice(T..(S1.length - 1)).reversed().joinToString("")
    val s2NotMovePart: String = S2.toCharArray().slice(T..(S2.length - 1)).joinToString("")

    val sMovedPart: String = s2MovePart.zip(s1MovePart, { a, b -> "${a ?: ""}${b ?: ""}" })
        .joinToString("")

    // println("answer")
    println("${s1NotMovePart}${sMovedPart}${s2NotMovePart}")
}
