import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val n = input.nextInt()

    // Write an action using println()
    // To debug: System.err.println("Debug messages...");

    var isCarmichael = !isPrime(n)
    for (primeFactor in primeDivision(n)) {
        if (((n - 1) % (primeFactor - 1)) != 0) {
            isCarmichael = false
            break
        }
    }

    // println("YES|NO")
    println(if (isCarmichael) "YES" else "NO")
}

fun primeDivision(num: Int): IntArray {
    val list = ArrayList<Int>()

    var n = num
    while (n % 2 == 0) {
        list.add(2)
        n /= 2
    }

    var i = 3
    while (n != 1) {
        if (n % i == 0) {
            list.add(i)
            n /= i
        } else {
            i += 2
        }
    }

    return list.stream().mapToInt({ j-> j }).toArray()
}

fun isPrime(num: Int): Boolean {
    var i = 2
    while (i < num) {
        if (num % i == 0) {
            return false
        }

        i++
    }

    return true
}
