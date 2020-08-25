import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val SIZE = input.nextInt()
    val N = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val names: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val name = input.nextLine()

        names.add(name)
    }
    val T = input.nextInt()
    val throwDatas: MutableList<ThrowData> = mutableListOf()
    for (i in 0 until T) {
        val throwName = input.next()
        val throwX = input.nextInt()
        val throwY = input.nextInt()

        throwDatas.add(ThrowData(throwName, throwX, throwY))
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val HALF_SIZE: Int = Math.floor(SIZE / 2.0).toInt()
    val scoreBoard: HashMap<String, Int> = hashMapOf()
    names.forEach { scoreBoard[it] = 0 }

    throwDatas.forEach { System.err.println("${it.name} ${it.x} ${it.y}") }

    throwDatas.forEach { throwData ->
        val name: String = throwData.name
        val x: Double = throwData.x.toDouble()
        val y: Double = throwData.y.toDouble()

        val distanceWithCenter: Double = Math.sqrt(x * x + y * y)
        val distanceWithEdge: Double = Math.sqrt(Math.pow(HALF_SIZE - Math.abs(x).toDouble(), 2.0) + Math.pow(HALF_SIZE - Math.abs(y).toDouble(), 2.0))

        val inSquareHorizontal: Boolean = -HALF_SIZE <= x && x <= HALF_SIZE
        val inSquareVertical: Boolean = -HALF_SIZE <= y && y <= HALF_SIZE

        val inSquare: Boolean = inSquareHorizontal && inSquareVertical
        val inCircle: Boolean = distanceWithCenter <= HALF_SIZE
        val inDiamond: Boolean = distanceWithCenter <= distanceWithEdge

        val score = when {
            inDiamond -> 15
            inCircle  -> 10
            inSquare  ->  5
            else      ->  0
        }

        scoreBoard[name] = scoreBoard[name]!! + score
    }

    val scores: List<Score> = scoreBoard.map { (name, score) ->
        Score(name, score)
    }

    val sortedScores: List<Score> = scores.sortedWith(
        compareByDescending<Score> { it.score }
        .thenBy { names.indexOf(it.name) }
    )

    // println("answer")
    sortedScores.forEach {
        println("${it.name} ${it.score}")
    }
}

class Score(val name: String, val score: Int)

class ThrowData(val name: String, val x: Int, val y: Int)
