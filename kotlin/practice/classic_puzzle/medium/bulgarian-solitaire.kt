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
    var piles: MutableList<Int> = mutableListOf()
    for (i in 0 until N) {
        val C = input.nextInt()

        piles.add(C)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    piles.removeAll { it == 0 }

    var sameConfigurationIndex: Int = 0
    val configurations: MutableList<String> = mutableListOf()

    while (true) {
        configurations.add(piles.sorted().joinToString(" "))

        val pilesSize: Int = piles.size
        piles = piles.map { it - 1 }.toMutableList()
        piles.removeAll { it == 0 }
        piles.add(pilesSize)

        val configuration: String = piles.sorted().joinToString(" ")

        if (configurations.contains(configuration)) {
            sameConfigurationIndex = configurations.indexOf(configuration)
            break
        }
    }

    // println("1")
    println(configurations.size - sameConfigurationIndex)
}
