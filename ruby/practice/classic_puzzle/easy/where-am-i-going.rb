# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = gets.to_i
_w = gets.to_i
rows = []
h.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Field
  PATH_STRING = '#'.freeze
  NOT_PATH_STRING = '.'.freeze

  def initialize(grid)
    temp_grid = grid.map { |row| [NOT_PATH_STRING, *row, NOT_PATH_STRING] }
    grid_width = temp_grid.first.size
    temp_grid.unshift [NOT_PATH_STRING] * grid_width
    temp_grid.push [NOT_PATH_STRING] * grid_width
    @initial_grid = temp_grid
  end

  def path_string
    @grid = @initial_grid.dup
    @y_index = 1
    @x_index = 1

    first_path_line_length = line_path_length
    @x_index = first_path_line_length

    paths = [first_path_line_length]
    while turn_result = turn
      paths << turn_result

      forward_path_length = line_path_length - 1
      @x_index += forward_path_length
      paths << forward_path_length
    end

    paths.join
  end

  private

  def line_path_length
    line = @grid[@y_index][@x_index..]
    not_path_index = line.find_index { |value| value != PATH_STRING }
    not_path_index || line.length
  end

  def turn
    left_string = @grid[@y_index - 1][@x_index]
    right_string = @grid[@y_index + 1][@x_index]

    return turn_left if left_string == PATH_STRING
    return turn_right if right_string == PATH_STRING

    nil
  end

  def turn_left
    @grid = @grid.reverse.transpose
    @y_index, @x_index = @x_index, @grid.first.size - @y_index - 1

    'L'
  end

  def turn_right
    @grid = @grid.transpose.reverse
    @y_index, @x_index = @grid.size - @x_index - 1, @y_index

    'R'
  end
end

grid = rows.map(&:chars)
field = Field.new grid

result = field.path_string

# puts "answer"
puts result
