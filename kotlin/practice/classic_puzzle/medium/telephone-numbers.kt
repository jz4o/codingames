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
    val telephones: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val telephone = input.next()

        telephones.add(telephone)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val numberTree: NumberTree = NumberTree(hashMapOf())
    telephones.forEach { telephone ->
        var targetTree: NumberTree = numberTree
        telephone.toCharArray().map(Char::toString).forEach { num ->
            if (!targetTree.child.containsKey(num)) {
                targetTree.child[num] = NumberTree(hashMapOf())
            }

            targetTree = targetTree.child[num]!!
        }
    }

    val result: Int = numberTree.toString().count { it == '=' }

    // The number of elements (referencing a number) stored in the structure.
    // println("number")
    println(result)
}

class NumberTree(val child: HashMap<String, NumberTree>) {
    override fun toString(): String {
        return child.toString()
    }
}

