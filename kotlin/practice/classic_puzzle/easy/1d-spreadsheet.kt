import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val spreadSheet: SpreadSheet = SpreadSheet()

    val input = Scanner(System.`in`)
    val N = input.nextInt()
    for (i in 0 until N) {
        val operation = input.next()
        val arg1 = input.next()
        val arg2 = input.next()

        spreadSheet.addCell(Cell(operation, arg1, arg2, null))
    }

    for (i in 0 until N) {

        // Write an answer using println()
        // To debug: System.err.println("Debug messages...");

        // println("1")
        println(spreadSheet.getValue(i))
    }
}

class SpreadSheet {
    val cells: ArrayList<Cell>

    init {
        cells = arrayListOf()
    }

    fun addCell(cell: Cell) {
        cells.add(cell)
    }

    fun getValue(cellIndex: Int): Int {
        val cellValue: Int? = cells[cellIndex].value
        return if (cellValue != null) cellValue else calcValue(cellIndex)
    }

    fun getArgValue(arg: String): Int {
        return if (arg == "_") 0
            else if (arg.contains("$")) getValue(arg.substring(1).toInt())
            else arg.toInt()
    }

    fun calcValue(cellIndex: Int): Int {
        val cell: Cell = cells[cellIndex]
        val arg1: Int = getArgValue(cell.arg1)
        val arg2: Int = getArgValue(cell.arg2)
        when(cell.operation) {
            "VALUE" -> cell.value = arg1
            "ADD"   -> cell.value = arg1 + arg2
            "SUB"   -> cell.value = arg1 - arg2
            "MULT"  -> cell.value = arg1 * arg2
        }

        return cell.value!!
    }
}

class Cell(val operation: String, val arg1: String, val arg2: String, var value: Int?)
