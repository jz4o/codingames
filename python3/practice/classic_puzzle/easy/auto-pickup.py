import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = int(input())
packet = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

class Packet:
    def __init__(self, instruction_id, packet_length, packet_info):
        self.instruction_id = instruction_id
        self.packet_length = packet_length
        self.packet_info = packet_info

packets = []
while any(packet):
    instruction_id = packet[0:3]
    packet_length = packet[3:7]
    decimal_packet_length = int(packet_length, 2)
    packet_info = packet[7:7 + decimal_packet_length]

    packet = packet[7 + decimal_packet_length:]

    packets.append(Packet(instruction_id, packet_length, packet_info))

packets = list(filter(lambda packet: packet.instruction_id == '101', packets))

result = ''.join(map(lambda packet: f'001{packet.packet_length}{packet.packet_info}', packets))

# print("001[length][item id]")
print(result)
