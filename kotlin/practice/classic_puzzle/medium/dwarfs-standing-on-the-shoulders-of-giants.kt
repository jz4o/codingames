import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val n = input.nextInt() // the number of relationships of influence
    val relationMap: HashMap<Int, MutableList<Int>> = hashMapOf()
    for (i in 0 until n) {
        val x = input.nextInt() // a relationship of influence between two people (x influences y)
        val y = input.nextInt()

        if (!relationMap.containsKey(x)) {
            relationMap[x] = mutableListOf()
        }

        relationMap[x]!!.add(y)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var deepLevel: Int = 0
    var targets: MutableList<Int> = relationMap.keys.toMutableList()
    while (!targets.isEmpty()) {
        deepLevel++
        targets = targets.fold(mutableListOf(), { result, target ->
            if (relationMap.containsKey(target)) {
                result.addAll(relationMap[target]!!)
            }

            result
        })
    }

    // The number of people involved in the longest succession of influences
    // println("2")
    println(deepLevel)
}
