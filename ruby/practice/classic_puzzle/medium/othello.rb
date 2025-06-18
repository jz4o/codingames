# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rows = []
8.times do
  row = gets.chomp

  rows << row
end
colour, move = gets.split

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

WALL = '#'.freeze
WHITE = 'W'.freeze
BLACK = 'B'.freeze
EMPTY = '-'.freeze

Position = Struct.new(:y, :x, :value)

def move_stone(grid, move_position)
  grid_height = grid.size
  grid_width = grid.first.size

  grid[move_position.y][move_position.x] = move_position

  # top
  top_positions = grid[...move_position.y].map { |row| row[move_position.x] }.reverse
  reverse_stones top_positions, move_position.value

  # top-right
  top_right_length = [move_position.y, grid_width - move_position.x - 1].min
  top_right_positions = (1..top_right_length).to_a.map { |i| grid[move_position.y - i][move_position.x + i] }
  reverse_stones top_right_positions, move_position.value

  # right
  right_positions = grid[move_position.y][(move_position.x + 1)..]
  reverse_stones right_positions, move_position.value

  # bottom-right
  bottom_right_length = [grid_height - move_position.y - 1, grid_width - move_position.x - 1].min
  bottom_right_positions = (1..bottom_right_length).to_a.map { |i| grid[move_position.y + i][move_position.x + i] }
  reverse_stones bottom_right_positions, move_position.value

  # bottom
  bottom_positions = grid[(move_position.y + 1)..].map { |row| row[move_position.x] }
  reverse_stones bottom_positions, move_position.value

  # bottom-left
  bottom_left_length = [grid_height - move_position.y - 1, move_position.x].min
  bottom_left_positions = (1..bottom_left_length).to_a.map { |i| grid[move_position.y + i][move_position.x - i] }
  reverse_stones bottom_left_positions, move_position.value

  # left
  left_positions = grid[move_position.y][...move_position.x].reverse
  reverse_stones left_positions, move_position.value

  # top-left
  top_left_length = [move_position.y, move_position.x].min
  top_left_positions = (1..top_left_length).to_a.map { |i| grid[move_position.y - i][move_position.x - i] }
  reverse_stones top_left_positions, move_position.value
end

def reverse_stones(line_positions, move_value)
  nearest_same_color_index = line_positions.index { |position| position.value == move_value }
  return unless nearest_same_color_index

  reversed_value = move_value == WHITE ? BLACK : WHITE

  reverse_target_positions = line_positions[...nearest_same_color_index]
  return unless reverse_target_positions.all? { |position| position.value == reversed_value }

  reverse_target_positions.each { |position| position.value = move_value }
end

grid = rows.map { |row| [WALL, *row.chars, WALL] }
grid.unshift([WALL] * 10)
grid.push([WALL] * 10)

grid = grid.map.with_index do |row, row_index|
  row.map.with_index do |value, column_index|
    Position.new row_index, column_index, value
  end
end

move_column, move_row = move.chars
move_column = ('a'..'h').to_a.index(move_column) + 1
move_row = move_row.to_i

move_position = Position.new(move_row, move_column, colour)

result =
  if grid[move_row][move_column].value == EMPTY
    before_white_count = grid.flatten.count { |position| position.value == WHITE }
    before_black_count = grid.flatten.count { |position| position.value == BLACK }

    move_stone(grid, move_position)

    after_white_count = grid.flatten.count { |position| position.value == WHITE }
    after_black_count = grid.flatten.count { |position| position.value == BLACK }

    is_legal_move = before_white_count != after_white_count && before_black_count != after_black_count
    is_legal_move ? "#{after_white_count} #{after_black_count}" : :NULL
  else
    :NOPE
  end

# puts "answer"
puts result
