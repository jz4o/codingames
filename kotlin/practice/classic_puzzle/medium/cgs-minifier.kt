import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
// const N: number = parseInt(readline());
    val N = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val cgsContents: MutableList<String> = mutableListOf()
    for (i in 0 until N) {
        val cgsContent = input.nextLine()

        cgsContents.add(cgsContent)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val CODE_POINT_A: Int = 'a'.toInt()

    val variables: HashMap<String, String> = hashMapOf()
    val characters: MutableList<String> = mutableListOf()
    val replacedCgsContents: List<String> = cgsContents.map { cgsContent ->
        var tmpCgsContent: String = cgsContent

        // replace variable part
        "\\$.+?\\$".toRegex().findAll(tmpCgsContent).forEach {
            val variable = it.value

            if (!variables.contains(variable)) {
                variables[variable] = "\\\$${(CODE_POINT_A + variables.size).toChar()}\\\$"
            }

            val escapedVariable: String = variable.replace("\\$".toRegex(), "\\\\\\$")
            tmpCgsContent = tmpCgsContent.replace(escapedVariable.toRegex(), variables[variable]!!)
        }

        // replace character part
        "'.+'".toRegex().findAll(tmpCgsContent).forEach {
            val character = it.value

            tmpCgsContent = tmpCgsContent.replace(character.toRegex(), "\\$${characters.size}")
            characters.add(character)
        }

        // replace spaces
        tmpCgsContent = tmpCgsContent.replace("\\s".toRegex(), "")

        tmpCgsContent
    }

    // restore character part
    val result: String = characters.foldIndexed(replacedCgsContents.joinToString("")) { index, result, character ->
        result.replace("\\$${index}".toRegex(), character)
    }

    // println("minified all CGS content")
    println(result)
}

