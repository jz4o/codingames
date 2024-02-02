# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = gets.to_i
w = gets.to_i
rows = []
h.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Position = Struct.new :y, :x, :value, :is_passed

WALL = '#'.freeze
EMPTY = '+'.freeze

LEFT_COLUMN_INDEX = 1
RIGHT_COLUMN_INDEX = w

value_grid = rows.map { |row| [WALL, *row.split, WALL] }
value_grid.unshift [WALL] * (w + 2)
value_grid.push [WALL] * (w + 2)

grid = value_grid.map.with_index do |row, row_index|
  row.map.with_index do |value, column_index|
    is_passed =
      if value == EMPTY && column_index == RIGHT_COLUMN_INDEX
        true
      elsif value == WALL
        false
      end

    Position.new row_index, column_index, value, is_passed
  end
end

grid.each do |row|
  left_position = row[LEFT_COLUMN_INDEX]
  next unless left_position.is_passed.nil?

  positions = []
  checked_positions = []
  be_check_positions = [left_position]
  while check_position = be_check_positions.pop
    positions << check_position

    around_positions = [
      grid[check_position.y - 1][check_position.x],
      grid[check_position.y][check_position.x - 1],
      grid[check_position.y][check_position.x + 1],
      grid[check_position.y + 1][check_position.x]
    ].filter { |position| position.value == EMPTY }

    be_check_positions += (around_positions - checked_positions)
    checked_positions += around_positions
  end

  is_passed = positions.any?(&:is_passed)
  positions.each { |position| position.is_passed = true } if is_passed
end

result = grid.count { |row| row[LEFT_COLUMN_INDEX].is_passed }

# puts "count"
puts result
