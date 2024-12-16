# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lines = []
3.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class SmallestMovesCountCalculator
  def self.calc(grid)
    center_value = grid[1][1]
    return -1 if center_value != '5'

    clockwise_values = get_clockwise_values_from_right_bottom grid
    empty_index = clockwise_values.index '.'
    clockwise_values.delete_at empty_index

    ordered_grid = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '.']
    ]
    clockwise_ordered_values = get_clockwise_values_from_right_bottom ordered_grid
    double_clockwise_ordered_values = (clockwise_ordered_values * 2).join.delete('.')

    return -1 unless double_clockwise_ordered_values.include? clockwise_values.join

    second_number_clockwise_ordered_values = clockwise_ordered_values[1]
    second_number_index = clockwise_values.index second_number_clockwise_ordered_values

    [
      ((second_number_index * (clockwise_values.size + 1)) - empty_index).abs,
      ((clockwise_values.size - second_number_index) * (clockwise_values.size + 1)) + empty_index
    ].min
  end

  def self.get_clockwise_values_from_right_bottom(grid)
    [
      grid[2][2],
      grid[1][0],
      grid[0][2],
      grid[2][1],
      grid[0][0],
      grid[1][2],
      grid[2][0],
      grid[0][1]
    ]
  end
  private_class_method :get_clockwise_values_from_right_bottom
end

grid = lines.map(&:chars)

result = SmallestMovesCountCalculator.calc grid

# puts "-1"
puts result
