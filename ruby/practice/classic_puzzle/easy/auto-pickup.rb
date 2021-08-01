# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_n = gets.to_i
packet = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Packet = Struct.new :instruction_id, :packet_length, :packet_info

packets = []
while packet&.length > 0
  instruction_id = packet[0..2]
  packet_length = packet[3..6]
  decimal_packet_length = packet_length.to_i(2)
  packet_info = packet[7, decimal_packet_length]
  packet = packet[7 + decimal_packet_length..]

  packets << Packet.new(instruction_id, packet_length, packet_info)
end
packets.filter! { |pack| pack.instruction_id == '101' }

result = packets.map { |pack| "001#{pack.packet_length}#{pack.packet_info}" }.join

# puts "001[length][item id]"
puts result
