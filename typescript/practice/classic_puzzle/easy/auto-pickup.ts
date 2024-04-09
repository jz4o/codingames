/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const _n: number = parseInt(readline());
const packet: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Packet {
    instructionId: string;
    packetLength: string;
    packetInfo: string;

    constructor(instructionId: string, packetLength: string, packetInfo: string) {
        this.instructionId = instructionId;
        this.packetLength = packetLength;
        this.packetInfo = packetInfo;
    }
}

const packets = [];
let tempPacket: string = packet;
while (tempPacket.length > 0) {
    const instructionId: string = tempPacket.substring(0, 3);
    const packetLength: string = tempPacket.substring(3, 7);
    const decimalPacketLength: number = parseInt(packetLength, 2);
    const packetInfo: string = tempPacket.substring(7, 7 + decimalPacketLength);
    tempPacket = tempPacket.substring(7 + decimalPacketLength);

    packets.push(new Packet(instructionId, packetLength, packetInfo));
}

const result: string = packets.filter(pack => pack.instructionId === '101')
        .map(pack => `001${pack.packetLength}${pack.packetInfo}`)
        .join('');

// console.log('001[length][item id]');
console.log(result);
