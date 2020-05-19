import java.util.*
import java.io.*
import java.math.*

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fun main(args : Array<String>) {
    val input = Scanner(System.`in`)
    val N = input.nextInt() // Number of elements which make up the association table.
    val Q = input.nextInt() // Number Q of file names to be analyzed.
    val extMimes = mutableMapOf<String, String>()
    for (i in 0 until N) {
        val EXT = input.next() // file extension
        val MT = input.next() // MIME type.

        extMimes[EXT.toLowerCase()] = MT
    }
    input.nextLine()
    val fnames: Array<String?> = arrayOfNulls(Q)
    for (i in 0 until Q) {
        val FNAME = input.nextLine() // One file name per line.

        fnames[i] = FNAME.toLowerCase()
    }

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val mimeTypes: Array<String?> = arrayOfNulls(Q)
    fnames.forEachIndexed { index, fname ->
        val fnameElements: List<String> = fname!!.split('.')
        val ext: String = if (fnameElements.size == 0) "" else fnameElements[fnameElements.size - 1]

        val mimeType: String? = extMimes[ext]

        mimeTypes[index] = if (ext == fname || mimeType == null) "UNKNOWN" else mimeType
    }

    // For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
    // println("UNKNOWN")
    mimeTypes.forEach {
        println(it)
    }
}
