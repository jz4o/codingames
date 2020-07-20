import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val a = input.nextInt()
    val b = input.nextInt()
    val c = input.nextInt()
    val d = input.nextInt()
    val n = input.nextInt()
    if (input.hasNextLine()) {
        input.nextLine()
    }
    val instructions: MutableList<String> = mutableListOf()
    for (i in 0 until n) {
        val instruction = input.nextLine()

        instructions.add(instruction)
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val register: LinkedHashMap<String, Int> = linkedMapOf(
        "a" to a,
        "b" to b,
        "c" to c,
        "d" to d
    )

    var index: Int = 0
    while (index < instructions.size) {
        val args: MutableList<String> = instructions[index].split(" ").toMutableList()

        val op: String = args[0]
        val firstArg: String = args[1]
        val secondArg: String = args[2]
        val thirdArg: String = if (args.size >= 4 ) args[3] else "0"

        val firstArgValue: Int = getValue(register, firstArg)
        val secondArgValue: Int = getValue(register, secondArg)
        var thirdArgValue: Int = getValue(register, thirdArg)

        // convert positive and negative for substract by addition
        if (op == "SUB") {
            thirdArgValue = "-${thirdArgValue}".replace("--", "").toInt()
        }

        if (op == "JNE") {
            if (secondArgValue != thirdArgValue) {
                index = firstArgValue
                continue
            }
        } else {
            register[firstArg] = secondArgValue + thirdArgValue
        }

        index++
    }

    // println("a b c d")
    println(register.values.joinToString(" "))
}

fun getValue(register: LinkedHashMap<String, Int>, registerKeyOrInt: String): Int {
    val minusFlag: Boolean = registerKeyOrInt.contains("-")
    val positiveRegisterKeyOrInt: String = registerKeyOrInt.replace("-", "")
    val positiveValue: Int = register[positiveRegisterKeyOrInt] ?: positiveRegisterKeyOrInt.toInt()

    return if (minusFlag) positiveValue * -1 else positiveValue
}
