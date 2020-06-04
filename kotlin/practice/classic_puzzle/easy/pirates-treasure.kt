import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val W = input.nextInt()
    val H = input.nextInt()
    val map: ArrayList<ArrayList<Int>> = arrayListOf()
    val mapLine: ArrayList<Int> = arrayListOf()
    for (i in 0 until W + 2) {
        mapLine.add(1)
    }
    map.add(mapLine)
    for (i in 0 until H) {
        val mapLine: ArrayList<Int> = arrayListOf()
        mapLine.add(1)
        for (j in 0 until W) {
            val v = input.nextInt()

            mapLine.add(v)
        }
        mapLine.add(1)

        map.add(mapLine)
    }
    map.add(mapLine)

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    var result: String = ""
    try {
        for (h in 1..H) {
            for (w in 1..W) {
                if (map[h][w] != 0) {
                    continue
                }

                val aroundMasses: ArrayList<Int> = arrayListOf()
                aroundMasses.add(map[h - 1][w - 1])
                aroundMasses.add(map[h - 1][w])
                aroundMasses.add(map[h - 1][w + 1])
                aroundMasses.add(map[h][w - 1])
                aroundMasses.add(map[h][w + 1])
                aroundMasses.add(map[h + 1][w - 1])
                aroundMasses.add(map[h + 1][w])
                aroundMasses.add(map[h + 1][w + 1])
                if (aroundMasses.contains(0)) {
                    continue
                }

                result = "${w - 1} ${h - 1}"
                throw Exception("break loop")
            }
        }
    } catch (e: Exception) {
        // for global escape
    }

    // println("x y")
    println(result)
}
