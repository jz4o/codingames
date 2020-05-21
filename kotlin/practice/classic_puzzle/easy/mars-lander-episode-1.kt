import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val surfaceN = input.nextInt() // the number of points used to draw the surface of Mars.
    for (i in 0 until surfaceN) {
        val landX = input.nextInt() // X coordinate of a surface point. (0 to 6999)
        val landY = input.nextInt() // Y coordinate of a surface point. By linking all the points together in a sequential fashion, you form the surface of Mars.
    }

    // game loop
    while (true) {
        val X = input.nextInt()
        val Y = input.nextInt()
        val hSpeed = input.nextInt() // the horizontal speed (in m/s), can be negative.
        val vSpeed = input.nextInt() // the vertical speed (in m/s), can be negative.
        val fuel = input.nextInt() // the quantity of remaining fuel in liters.
        val rotate = input.nextInt() // the rotation angle in degrees (-90 to 90).
        val power = input.nextInt() // the thrust power (0 to 4).

        // Write an action using println()
        // To debug: System.err.println("Debug messages...");

        val vPower: Int = if (vSpeed <= -40) 4 else 0

        // 2 integers: rotate power. rotate is the desired rotation angle (should be 0 for level 1), power is the desired thrust power (0 to 4).
        // println("0 3")
        println("0 " + vPower)
    }
}
