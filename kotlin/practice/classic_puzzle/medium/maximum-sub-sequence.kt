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
    val ls: MutableList<Int> = mutableListOf()
    for (i in 0 until N) {
        val l = input.nextInt()

        ls.add(l)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val lists: MutableList<MutableList<Int>> = mutableListOf()
    ls.forEach { l ->
        lists.forEach { list ->
            if (list.last() + 1 == l) {
                list.add(l)
            }
        }

        lists.add(mutableListOf(l))
    }

    val maxSize: Int = lists.fold(0) { max, list -> Math.max(max, list.size) }
    val result: String = lists.findLast { it.size == maxSize }!!.joinToString(" ")

    // println("1 2 3 4 5")
    println(result)
}
