import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val MESSAGE = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var binaries: MutableList<Int> = MESSAGE.toCharArray().fold(mutableListOf()) { binaries, char ->
        val binary: String = char.toInt().toString(2)
        val sevenBitBinary: String = binary.padStart(7, '0')
        val sevenBitBinaryNumberArray: List<Int> = sevenBitBinary.toCharArray().map(Char::toString).map(String::toInt)

        binaries.addAll(sevenBitBinaryNumberArray)

        binaries
    }

    val groupedBinaries: MutableList<List<Int>> = mutableListOf()
    while (binaries.size > 0) {
        val firstBinary: Int = binaries.first()
        val searchTargetBinary: Int = firstBinary * -1 + 1

        val targetBinaryIndex: Int = binaries.indexOf(searchTargetBinary)
        val deleteSize: Int = if (targetBinaryIndex < 0) binaries.size else targetBinaryIndex

        val deleteBinaries: List<Int> = binaries.subList(0, deleteSize)
        binaries = binaries.subList(deleteSize, binaries.size)

        groupedBinaries.add(deleteBinaries)
    }

    val result: MutableList<String> = mutableListOf()
    groupedBinaries.forEach {
        result.add("0".repeat(2 - it.first()))
        result.add("0".repeat(it.size))
    }

    // println("answer")
    println(result.joinToString(" "))
}
