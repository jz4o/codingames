import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val s = input.nextLine()

    var result: String? = s
    while (true) {
        if (!isEncodable(result)) {
            break
        }

        result = encode(result)
    }

    println(result)
}

fun isEncodable(str: String?): Boolean =
    encode(str) != null && encode(str) != str

fun encode(str: String?): String? {
    if (str!!.length % 2 != 0) {
        return null
    }

    val result: String = str.chunked(2).fold("") { result, values ->
        val count: Int = values.first().toString().toInt()
        val value: String = values.last().toString()

        "${result}${value.repeat(count)}"
    }

    return if (isDecodable(result, str)) result else null
}

fun isDecodable(encodedStr: String, originalStr: String): Boolean {
    var tmpEncodedStr = encodedStr

    var result: String = ""
    while (tmpEncodedStr.length != 0) {
        val char: Char = tmpEncodedStr.first()
        val charGroupLength: Int = Regex("^${char}+").find(tmpEncodedStr)!!.value.length
        tmpEncodedStr = tmpEncodedStr.substring(charGroupLength..tmpEncodedStr.lastIndex)

        result = "${result}${charGroupLength}${char}"
    }

    return result == originalStr
}
