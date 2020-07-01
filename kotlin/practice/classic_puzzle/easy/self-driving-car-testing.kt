import   java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
// const N: number = parseInt(readline());
    val N = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val xthenCommands = input.nextLine()
    val rthenRoadpatterns: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val rthenRoadpattern = input.nextLine()

        rthenRoadpatterns.add(rthenRoadpattern)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var commands: List<String> = xthenCommands.split(";")
    var position: Int = commands.first().toInt()
    commands = commands.drop(1)

    var commandChars: MutableList<String> = mutableListOf()
    for (command in commands) {
        val amount: Int = command.dropLast(1).toInt()
        val comm: String = command.takeLast(1)

        for (i in 0 until amount) {
            commandChars.add(comm)
        }
    }

    val results: MutableList<String> = mutableListOf()
    for (rthenRoadpattern in rthenRoadpatterns) {
        val (count, pattern) = rthenRoadpattern.split(";")
        for (i in 0 until count.toInt()) {
            val command: String = commandChars.first()
            commandChars = commandChars.drop(1).toMutableList()
            when (command) {
                "L" -> position--
                "R" -> position++
            }

            results.add("${pattern.substring(0, position - 1)}#${pattern.substring(position)}")
        }
    }

    // println("answer")
    for (result in results) {
        println(result)
    }
}
