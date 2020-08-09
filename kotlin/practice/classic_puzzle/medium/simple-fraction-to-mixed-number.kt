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
    val xys: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val xY = input.next()

        xys.add(xY)
    }
    for (i in 0 until N) {

        // Write an answer using println()
        // To debug: System.err.println("Debug messages...");

        val xy: String = xys[i]
        val (x, y) = xy.split("/").map { it.toInt() }

        if (y == 0) {
            println("DIVISION BY ZERO")
            continue
        }

        val int: Int = (x / y).toInt()
        val intStr: String = if (int != 0) int.toString() else ""

        val rat: Int = x % y
        val gcdNum: Int = gcd(rat, y)
        val ratX: Int = Math.floor(rat.toDouble() / gcdNum.toDouble()).toInt()
        val ratY: Int = Math.floor(y.toDouble() / gcdNum.toDouble()).toInt()
        val minusElements: List<Int> = arrayOf(int, ratX, ratY).filter { it < 0 }
        val minus: String = if (minusElements.size % 2 == 1) "-" else ""
        val ratStr: String = if (rat != 0) "${minus}${Math.abs(ratX)}/${Math.abs(ratY)}" else ""

        val result: String = "${intStr} ${ratStr}".trim()

        // println("answer")
        println(if (result.length != 0) result else "0")
    }
}

fun gcd(x: Int, y: Int): Int {
    var tmpX: Int = x
    var tmpY: Int = y
    var tmp: Int = tmpY
    while (tmpX % tmpY != 0) {
        tmp = tmpX % tmpY
        tmpX = tmpY
        tmpY = tmp
    }

    return tmpY
}
