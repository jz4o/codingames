# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
rooms = []
max_money = 0
@n.times do
  number, money, access1, access2 = gets.chomp.split.map(&:to_i)
  prev_rooms = rooms.select { |room| room[:accesses].include? number }
  next if prev_rooms.size.zero? && !number.zero?

  sum_money = money + prev_rooms.map { |room| room[:sum_money] }.max.to_i

  rooms << {
    number:,
    sum_money:,
    accesses: [access1, access2]
  }

  max_money = [max_money, sum_money].max if access1.zero? || access2.zero?
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"
puts max_money
