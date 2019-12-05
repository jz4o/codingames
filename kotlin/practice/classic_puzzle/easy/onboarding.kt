import java.util.*
import java.io.*
import java.math.*

fun main(args : Array<String>) {
    val input = Scanner(System.`in`)

    // game loop
    while (true) {
        val enemy1 = input.next() // name of enemy 1
        val dist1 = input.nextInt() // distance to enemy 1
        val enemy2 = input.next() // name of enemy 2
        val dist2 = input.nextInt() // distance to enemy 2

        // Write an action using println()
        if (dist1 < dist2) {
            println(enemy1)
        } else {
            println(enemy2)
        }

        // Enter the code here

    }
}
