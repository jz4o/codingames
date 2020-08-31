import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val W = input.nextInt()
    val H = input.nextInt()
    val X = input.nextInt()
    val Y = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val grid: MutableList<MutableList<String?>> = mutableListOf()
    grid.add(arrayOfNulls<String?>(W + 2).toMutableList<String?>())
    for (i in 0 until H) {
        val R = input.nextLine()

        val row: MutableList<String?> = mutableListOf()
        row.add(null)
        row.addAll(R.toCharArray().map(Char::toString).toMutableList<String?>())
        row.add(null)

        grid.add(row)
    }
    grid.add(arrayOfNulls<String?>(W + 2).toMutableList<String?>())

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val checkedMasses: MutableList<Mass> = mutableListOf()
    val beCheckMasses: MutableList<Mass> = mutableListOf(Mass(Y + 1, X + 1))
    val exitMasses: MutableList<Mass> = mutableListOf()
    while (beCheckMasses.size > 0) {
        val checkMass: Mass = beCheckMasses.removeAt(beCheckMasses.lastIndex)
        val y: Int = checkMass.y
        val x: Int = checkMass.x

        if (checkedMasses.find { it.y == y && it.x == x } != null) {
            continue
        }

        checkedMasses.add(checkMass)

        val nearMasses: List<Mass> = listOf(
            Mass(y, x - 1),
            Mass(y - 1, x),
            Mass(y, x + 1),
            Mass(y + 1, x)
        )

        nearMasses.forEach {
            val mass: String? = grid[it.y][it.x]
            if (mass == ".") {
                beCheckMasses.add(Mass(it.y, it.x))
            } else if (mass == null) {
                exitMasses.add(Mass(y - 1, x - 1))
            }
        }
    }

    val sortedExitMasses: List<Mass> = exitMasses.sortedWith(
        compareBy<Mass> { it.x }
        .thenBy { it.y }
    )

    // println("answer")
    println(sortedExitMasses.size)
    sortedExitMasses.forEach {
        println("${it.x} ${it.y}")
    }
}

class Mass(val y: Int, val x: Int)
