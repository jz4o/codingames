# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h, _w = gets.split.collect(&:to_i)
rows = []
h.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Position = Struct.new :y, :x, :value

YOUR_POSITION = 'X'.freeze
WALL = '#'.freeze

rows.map! { |row| "#{WALL}#{row}#{WALL}" }
wall_row = WALL * rows.first.size
rows.unshift wall_row
rows.push wall_row

grid = rows.map.with_index do |row, row_index|
  row.chars.map.with_index do |value, column_index|
    Position.new row_index, column_index, value
  end
end

start_position = grid.flatten.find { |position| position.value == YOUR_POSITION }

move_histories = []
temp_histories = [[start_position]]
while temp_history = temp_histories.pop
  last_position = temp_history.last

  around_positions = [
    grid[last_position.y - 1][last_position.x], # top
    grid[last_position.y][last_position.x + 1], # right
    grid[last_position.y + 1][last_position.x], # bottom
    grid[last_position.y][last_position.x - 1]  # left
  ]

  around_positions.filter! { |position| !temp_history.include?(position) && position.value != WALL }

  move_histories << temp_history and next if around_positions.empty?

  around_positions.each do |position|
    temp_histories << temp_history + [position]
  end
end

amount_of_golds = move_histories.map do |move_history|
  move_history.sum { |position| position.value.to_i }
end
result = amount_of_golds.max

# puts "answer"
puts result
