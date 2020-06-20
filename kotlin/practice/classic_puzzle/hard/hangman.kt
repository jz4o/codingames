import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val word = input.nextLine()
    val chars = input.nextLine()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val BEAM:     String = "+--+"
    val NO_HEAD:  String = "|"
    val HEAD:     String = "|  o"
    val NO_BODY:  String = "|"
    val BODY:     String = "|  |"
    val ONE_ARM:  String = "| /|"
    val BOTH_ARM: String = "| /|\\"
    val NO_LEG:   String = "|\\"
    val ONE_LEG:  String = "|\\/"
    val BOTH_LEG: String = "|\\/ \\"
    val HANGMAN_STATUS: Array<Array<String>> = arrayOf(
        arrayOf(BEAM, NO_HEAD, NO_BODY,  NO_LEG  ),
        arrayOf(BEAM, HEAD,    NO_BODY,  NO_LEG  ),
        arrayOf(BEAM, HEAD,    BODY,     NO_LEG  ),
        arrayOf(BEAM, HEAD,    ONE_ARM,  NO_LEG  ),
        arrayOf(BEAM, HEAD,    BOTH_ARM, NO_LEG  ),
        arrayOf(BEAM, HEAD,    BOTH_ARM, ONE_LEG ),
        arrayOf(BEAM, HEAD,    BOTH_ARM, BOTH_LEG)
    )

    // answer to guess
    val result: String = word.toCharArray().map({ char ->
        if (chars.contains(char.toLowerCase())) char else "_"
    }).joinToString("")

    // counting errors of guess
    var lowerWord: String = word.toLowerCase()
    var errors: Int = 0
    for (char in chars.split(" ")) {
        if (lowerWord.contains(char)) {
            lowerWord = lowerWord.replace(char.toString(), "")
        } else {
            errors++
        }
    }

    // println("answer")
    println(HANGMAN_STATUS[errors].joinToString("\n"))
    println(result)
}
