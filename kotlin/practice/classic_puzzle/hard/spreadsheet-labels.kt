import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val n = input.nextInt()
    val labels: MutableList<String> = mutableListOf()
    for (i in 0 until n) {
        val label = input.next()

        labels.add(label)
    }

    val results: List<String> = labels
        .map { SpreadsheetLabel(it) }
        .map { if (it.isIntLabel()) it.toAlphaLabel() else it.toIntLabel() }

    println(results.joinToString(" "))
}

class SpreadsheetLabel(val label: String) {
    companion object {
        val ALPHAS: CharArray = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray()
    }

    fun isIntLabel(): Boolean = label.matches("^\\d+$".toRegex())

    fun toAlphaLabel(): String {
        var result: String = ""

        var tmpLabel: Long = label.toLong()
        while (tmpLabel > 0) {
            var alphaIndex: Int = (tmpLabel % ALPHAS.size).toInt()
            tmpLabel = tmpLabel / ALPHAS.size

            if (alphaIndex == 0) {
                alphaIndex = ALPHAS.size
                tmpLabel--
            }

            result = ALPHAS[alphaIndex - 1] + result
        }

        return result
    }

    fun toIntLabel(): String =
        label.toCharArray().reversed().foldIndexed(0L) { index, result, char ->
            val baseNumber: Long = Math.pow(ALPHAS.size.toDouble(), index.toDouble()).toLong()
            val alphaIndex: Int = ALPHAS.indexOf(char) + 1

            result + baseNumber * alphaIndex
        }.toString()
}
