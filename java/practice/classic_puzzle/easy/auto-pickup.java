import java.util.*;
import java.util.stream.Collectors;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        String packet = in.next();

        // Write an answer using System.out.println()
        // To debug: System.err.println("Debug messages...");

        ArrayList<Packet> packets = new ArrayList<Packet>();
        while (packet.length() > 0) {
            String instructionId = packet.substring(0, 3);
            String packetLength = packet.substring(3, 7);
            int decimalPacketLength = Integer.parseInt(packetLength, 2);
            String packetInfo = packet.substring(7, 7 + decimalPacketLength);
            packet = packet.substring(7 + decimalPacketLength);

            packets.add(new Packet(instructionId, packetLength, packetInfo));
        }

        String result = packets.stream()
                .filter(pack -> pack.instructionId.equals("101"))
                .map(pack -> "001" + pack.getPacketLength() + pack.getPacketInfo())
                .collect(Collectors.joining(""));

        // System.out.println("001[length][item id]");
        System.out.println(result);
    }

    public static class Packet {
        private String instructionId;
        private String packetLength;
        private String packetInfo;

        public Packet(String instructionId, String packetLength, String packetInfo) {
            this.instructionId = instructionId;
            this.packetLength = packetLength;
            this.packetInfo = packetInfo;
        }

        public String getInstructionId() {
            return instructionId;
        }

        public String getPacketLength() {
            return packetLength;
        }

        public String getPacketInfo() {
            return packetInfo;
        }
    }
}
