import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val r1 = input.nextInt()

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    var isSuccess: Boolean = false
    for (i in r1 - 1 downTo 1) {
        var iSum = 0
        for (c in i.toString().toCharArray()) {
            iSum += c.toString().toInt()
        }

        if (i + iSum == r1) {
            isSuccess = true
            break
        }
    }

    //println("YES|NO")
    println(if (isSuccess) "YES" else "NO")
}
