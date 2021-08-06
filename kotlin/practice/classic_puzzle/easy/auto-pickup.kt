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
    val packet = input.next()

    // Write an answer using println()
    // To debug: System.err.println("Debug messages...");

    val packets: ArrayList<Packet> = arrayListOf()
    var tempPacket: String = packet
    while (tempPacket.length > 0) {
        val instructionId: String = tempPacket.substring(0, 3)
        val packetLength: String = tempPacket.substring(3, 7)
        val decimalPacketLength: Int = packetLength.toInt(2)
        val packetInfo: String = tempPacket.substring(7, 7 + decimalPacketLength)
        tempPacket = tempPacket.substring(7 + decimalPacketLength)

        packets.add(Packet(instructionId, packetLength, packetInfo))
    }

    val result: String = packets.filter { it.instructionId == "101" }
            . map { "001" + it.packetLength + it.packetInfo }
            .joinToString("")

    // println("001[length][item id]")
    println(result)
}

data class Packet(val instructionId: String, val packetLength: String, val packetInfo: String)
