import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val x = input.nextLine()
    val n = input.nextInt()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val xElements: List<String> = x.split("-")
    val ab: String = xElements[0]
    var cde: Int = xElements[1].toInt()
    val fg: String = xElements[2]

    val alpha: String = "$ab$fg"
    val alphaInt: Int = alphaToInt(alpha)
    cde = cde + n - 1

    val carry: Int = Math.floor(cde / 999.0).toInt()
    cde = cde % 999

    val newAlpha: String = intToAlpha(alphaInt + carry)
    val newAb: String = newAlpha.substring(0, 2)
    val newCde: String = String.format("%03d", cde + 1)
    val newFg: String = newAlpha.substring(2)

    // println("AA-000-AA")
    println("${newAb}-${newCde}-${newFg}")
}

val ALPHAS: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

fun alphaToInt(alpha: String): Int {
    return alpha.toCharArray().reversed().foldIndexed(0) { index, sum, value ->
        val alphaBase: Int = Math.pow(ALPHAS.length.toDouble(), index.toDouble()).toInt()
        val alphaInt: Int = ALPHAS.indexOf(value) + 1

        sum + (alphaBase * alphaInt)
    }
}

fun intToAlpha(alphaInt: Int): String {
    var result: String = ""

    var tempAlphaInt = alphaInt
    while (tempAlphaInt > 0) {
        var i = tempAlphaInt % ALPHAS.length
        if (i == 0) {
            i = ALPHAS.length
            tempAlphaInt--
        }

        tempAlphaInt = if (tempAlphaInt > ALPHAS.length) Math.floor(tempAlphaInt.toDouble() / ALPHAS.length).toInt() else 0

        result = "${ALPHAS[i - 1]}${result}"
    }

    return result
}
