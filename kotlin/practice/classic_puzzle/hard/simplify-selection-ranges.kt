import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val N = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val numberList: List<Int> = N.replace("[\\[\\]]".toRegex(), "")
                                 .split(",")
                                 .map { n -> Integer.parseInt(n) }
                                 .sorted()
    val numbers: ArrayList<Int> = ArrayList(numberList)

    val result: ArrayList<String> = arrayListOf()
    val temp: ArrayList<Int> = arrayListOf()
    while (numbers.size > 0) {
        if (temp.size == 0 || (temp[temp.size - 1] + 1) == numbers[0]) {
            temp.add(numbers.get(0))
            numbers.removeAt(0)
        } else {
            result.add(buildAddItems(temp))
            temp.clear()
        }
    }

    if (temp.size > 0) {
        result.add(buildAddItems(temp))
    }

    // println("answer")
    println(result.joinToString(","))
}

fun buildAddItems(array: ArrayList<Int>): String {
   return if (array.size >= 3) "${array.get(0)}-${array.get(array.size - 1)}" else array.joinToString(",")
}
