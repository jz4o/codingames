import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 * ---
 * Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val lightX = input.nextInt() // the X position of the light of power
    val lightY = input.nextInt() // the Y position of the light of power
    val initialTx = input.nextInt() // Thor's starting X position
    val initialTy = input.nextInt() // Thor's starting Y position

    var tx: Int = initialTx
    var ty: Int = initialTy

    // game loop
    while (true) {
        val remainingTurns = input.nextInt() // The remaining amount of turns Thor can move. Do not remove this line.

        // Write an action using println()
        // To debug: System.err.println("Debug messages...");

        val moveX: String = if (lightX < tx) { tx--; "W" } else if (tx < lightX) { tx++; "E" } else { "" }
        val moveY: String = if (lightY < ty) { ty--; "N" } else if (ty < lightY) { ty++; "S" } else { "" }

        // A single line providing the move to be made: N NE E SE S SW W or NW
        // println("SE")
        println(moveY + moveX)
    }
}
