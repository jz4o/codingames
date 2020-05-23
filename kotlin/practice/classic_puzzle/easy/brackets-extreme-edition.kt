import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val expression = input.next()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val BRACKETS: Map<String, String> = mapOf(
        "(" to ")",
        "[" to "]",
        "{" to "}"
    )

    val bracketStack: ArrayList<String> = arrayListOf()
    val collectFlag: Boolean = !expression.replace("[^\\[\\]\\(\\)\\{\\}]".toRegex(), "")
                                          .toCharArray()
                                          .map({Character.toString(it)})
                                          .any(fun(bracket: String): Boolean{
                                              if (BRACKETS.get(bracket) != null) {
                                                  bracketStack.add(bracket)
                                                  return false
                                              }

                                              if (bracketStack.size == 0) {
                                                  return true
                                              }

                                              val latestBracket: String = bracketStack.removeAt(bracketStack.size - 1)
                                              if (BRACKETS.get(latestBracket) == bracket) {
                                                  return false
                                              }

                                              return true
                                          })

    // println("true/false")
    println(collectFlag && bracketStack.size == 0)
}
