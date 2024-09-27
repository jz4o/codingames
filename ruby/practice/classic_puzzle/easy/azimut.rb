# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

start_direction = gets.chomp
n = gets.to_i
turns = []
n.times do
  turn = gets.chomp
  turns << turn
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

DIRECTIONS = %w[N NE E SE S SW W NW].freeze
direction_index = DIRECTIONS.index start_direction

result_direction = turns.reduce(direction_index) do |direction, turn|
  case turn.to_sym
  when :RIGHT then direction + 1
  when :LEFT  then direction - 1
  when :BACK  then direction + 4
  else direction
  end
end

result = DIRECTIONS[result_direction % DIRECTIONS.size]

# puts "direction"
puts result
