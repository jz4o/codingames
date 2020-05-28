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
    val Y = input.nextInt()
    val cages: ArrayList<Cage> = arrayListOf()
    for (i in 0 until N) {
        val S = input.nextInt()
        val H = input.nextInt()
        val A = input.nextInt()

        cages.add(Cage(S.toLong(), H.toLong(), A.toLong()))
    }
    for (i in 0 until Y) {

        // Write an answer using println()
        // To debug: System.err.println("Debug messages...");

        val alive: Long = cages.fold(0L, { alive, cage ->
            val sick: Long = cage.sick * Math.pow(2.0, i.toDouble()).toLong()
            cage.alive -= sick

            alive + Math.max(cage.alive, 0)
        })

        // println("answer")
        println(alive)

        if (alive == 0L) {
            break
        }
    }
}

class Cage(
    val sick:    Long,
    val healthy: Long,
    var alive:   Long
)
