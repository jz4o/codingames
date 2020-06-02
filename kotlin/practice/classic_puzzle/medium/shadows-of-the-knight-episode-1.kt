import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val W = input.nextInt() // width of the building.
    val H = input.nextInt() // height of the building.
    val N = input.nextInt() // maximum number of turns before game over.
    val X0 = input.nextInt()
    val Y0 = input.nextInt()

    var bombMinHeight: Int = H
    var bombMaxHeight: Int = 0
    var bombMinWidth: Int = 0
    var bombMaxWidth: Int = W

    var x: Int = X0
    var y: Int = Y0

    // game loop
    while (true) {
        val bombDir = input.next() // the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

        // Write an action using println()
        // To debug: System.err.println("Debug messages...");

        if (bombDir.contains("U")) {
            bombMinHeight = y
            y -= Math.ceil((y - bombMaxHeight).toDouble() / 2.0).toInt()
        } else if (bombDir.contains("D")) {
            bombMaxHeight = y
            y += Math.ceil((bombMinHeight - y).toDouble() / 2.0).toInt()
        }

        if (bombDir.contains("R")) {
            bombMinWidth = x
            x += Math.ceil((bombMaxWidth - x).toDouble() / 2.0).toInt()
        } else if (bombDir.contains("L")) {
            bombMaxWidth = x
            x -= Math.ceil((x - bombMinWidth).toDouble() / 2.0).toInt()
        }

        // the location of the next window Batman should jump to.
        // println("0 0")
        println("$x $y")
    }
}
