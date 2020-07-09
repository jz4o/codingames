import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val alignment = input.nextLine()
    val N = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val texts: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val text = input.nextLine()

        texts.add(text)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val width: Int = texts.map { it.length }.reduce { max, i -> Math.max(max, i) }

    val results: MutableList<String> = mutableListOf()
    when (alignment) {
        "LEFT"    -> results.addAll(texts)
        "RIGHT"   -> results.addAll(texts.map { " ".repeat(width - it.length) + it })
        "CENTER"  -> results.addAll(texts.map { " ".repeat(Math.floor((width - it.length + 1) / 2.0).toInt()) + it })
        "JUSTIFY" -> results.addAll(texts.map { justifyText(it, width) })
    }

    // println("answer")
    for (result in results) {
        println(result)
    }
}

fun justifyText(text: String, width: Int): String {
    if (text.length == width) {
        return text
    }

    val words: List<String> = text.split(" ")
    val spaceSize: Int = width - words.joinToString("").length
    val eachSpaceSize: Int = spaceSize / (words.size - 1)
    val spaceSizes: List<Int> = (1..(words.size - 1)).map {
        Math.floor(eachSpaceSize.toDouble() * it).toInt() - Math.floor(eachSpaceSize.toDouble() * (it - 1)).toInt()
    }

    val result: String = words.foldIndexed("") { index, result, word ->
        val space = if (index < spaceSizes.size) " ".repeat(Math.floor(spaceSizes[index].toDouble()).toInt()) else ""
        "$result$word$space"
    }

    return result
}
