package main

import "fmt"

import "strconv"

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

func main() {
    var n int
    fmt.Scan(&n)

    var packet string
    fmt.Scan(&packet)

    packets := []Packet{}
    for len(packet) > 0 {
        instructionId := packet[0:3]
        packetLength := packet[3:7]
        decimalPacketLength, _ := strconv.ParseInt(packetLength, 2, 64)
        packetInfo := packet[7:7 + decimalPacketLength]
        packet = packet[7 + decimalPacketLength:]

        packets = append(packets, Packet{instructionId, packetLength, packetInfo})
    }

    result := ""
    for _, pack := range packets {
        if pack.instructionId != "101" {
            continue
        }

        result += "001" + pack.packetLength + pack.packetInfo
    }

    // fmt.Fprintln(os.Stderr, "Debug messages...")
    // fmt.Println("001[length][item id]")// Write answer to stdout
    fmt.Println(result)
}

type Packet struct {
    instructionId string
    packetLength string
    packetInfo string
}
