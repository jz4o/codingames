# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

number_snails = gets.to_i
speed_snails = []
number_snails.times do
  speed_snail = gets.to_i
  speed_snails << speed_snail
end
map_height = gets.to_i
_map_width = gets.to_i
rows = []
map_height.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Position = Struct.new :y, :x
Snail = Struct.new :number, :speed, :position, :goal_time

snails = []
goal_positions = []

rows.each_with_index do |row, row_index|
  row.chars.each_with_index do |value, value_index|
    case value
    when /\d/
      value = value.to_i
      snails << Snail.new(value, speed_snails[value.pred], Position.new(row_index, value_index))
    when '#'
      goal_positions << Position.new(row_index, value_index)
    end
  end
end

snails.each do |snail|
  next if snail.speed.zero?

  distance = goal_positions.map { |goal| (goal.y - snail.position.y).abs + (goal.x - snail.position.x).abs }.min

  snail.goal_time = distance.fdiv snail.speed
end
winner = snails.filter(&:goal_time).min_by(&:goal_time)

result = winner.number

# puts "winner is number"
puts result
