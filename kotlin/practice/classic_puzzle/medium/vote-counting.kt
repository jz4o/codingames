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
    val M = input.nextInt()
    val voters: HashMap<String, Int> = hashMapOf()
    for (i in 0 until N) {
        val personName = input.next()
        val nbVote = input.nextInt()

        voters.put(personName, nbVote)
    }
    val votes: HashMap<String, MutableList<String>> = hashMapOf()
    for (i in 0 until M) {
        val voterName = input.next()
        val voteValue = input.next()

        if (!votes.containsKey(voterName)) {
            votes.put(voterName, mutableListOf())
        }

        votes[voterName]!!.add(voteValue)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var yes: Int = 0
    var no: Int = 0
    for ((voterName, votableCount) in voters) {
        val votesByVoter: MutableList<String>? = votes[voterName]
        if (votesByVoter == null || votesByVoter.size > votableCount) {
            continue
        }

        yes += votesByVoter.filter { it == "Yes" }.size
        no += votesByVoter.filter { it == "No" }.size
    }

    // println("output")
    println("$yes $no")
}
