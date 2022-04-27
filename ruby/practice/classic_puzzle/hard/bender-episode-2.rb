# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
rooms = []
n.times do
  room = gets.chomp
  rooms << room
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def get_sum_money(room_hash, number)
  return room_hash[number][:sum_money] if room_hash[number][:sum_money]

  prev_room_sum_money = room_hash[number][:prev_rooms].map do |prev_room_number|
    get_sum_money room_hash, prev_room_number
  end.max

  # 0 when unreachable from room 0
  room_hash[number][:sum_money] = prev_room_sum_money ? prev_room_sum_money + room_hash[number][:money] : 0
end

room_hash = {}
rooms.each do |room|
  number, money, next_number1, next_number2 = room.split

  [number, next_number1, next_number2].each do |room_number|
    room_hash[room_number] = { sum_money: nil, money: nil, prev_rooms: [] } unless room_hash.key? room_number
  end

  room_hash[number][:money] = money.to_i
  room_hash[next_number1][:prev_rooms] << number
  room_hash[next_number2][:prev_rooms] << number
end
room_hash['0'][:sum_money] = room_hash['0'][:money]
room_hash['E'][:money] = 0

result = get_sum_money room_hash, 'E'

# puts "answer"
puts result
