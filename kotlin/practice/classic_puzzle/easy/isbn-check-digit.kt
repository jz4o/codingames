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
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val isbns: ArrayList<String> = arrayListOf()
    for (i in 0 until N) {
        val ISBN = input.nextLine()

        isbns.add(ISBN)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val MODULUS_WEIGHTS: Map<Int, IntArray> = mapOf(
        10 to intArrayOf(1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3),
        11 to intArrayOf(10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
    )

    val invalids: ArrayList<String> = arrayListOf()
    for (isbn in isbns) {
        if (!Regex("^\\d+X?$").matches(isbn)) {
            invalids.add(isbn)
            continue
        }

        val modulus: Int = if (isbn.length == 10) {
                               11
                           } else if (isbn.length == 13) {
                               if (isbn.endsWith("X")) {
                                   invalids.add(isbn)
                                   continue
                               }

                               10
                           } else {
                               invalids.add(isbn)
                               continue
                           }

        val dataDigits: ArrayList<Int> = isbn.toCharArray()
                                             .map { d -> "0123456789X".toCharArray().indexOf(d) }
                                             .toCollection(ArrayList())
        val checkDigit: Int = dataDigits.removeAt(dataDigits.size - 1)

        val sum: Int = dataDigits.foldIndexed(0) { index, sum, digit ->
            sum + digit * MODULUS_WEIGHTS!![modulus]!![index]
        }

        val checkSum: Int = (modulus - (sum % modulus)) % modulus
        if (checkSum != checkDigit) {
            invalids.add(isbn)
        }
    }

    // println("answer")
    println("${invalids.size} invalid:")
    invalids.forEach { invalid ->
        println(invalid)
    }
}
