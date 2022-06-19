# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r = gets.to_i
c = gets.to_i
t = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Cell = Struct.new :y, :x, :value, :is_reachable

def check_reachable_cell(grid, target_y, target_x, threshold)
  target_cell = grid[target_y][target_x]

  return target_cell.is_reachable unless target_cell.is_reachable.nil?

  accessible_value = target_cell.value <= threshold
  is_upper_left_cell = target_cell.y.zero? && target_cell.x.zero?
  unless target_cell.y.zero?
    top_cell_is_reachable = check_reachable_cell(grid, target_cell.y.pred, target_cell.x, threshold)
  end
  unless target_cell.x.zero?
    left_cell_is_reachable = check_reachable_cell(grid, target_cell.y, target_cell.x.pred, threshold)
  end

  target_cell.is_reachable = accessible_value && (is_upper_left_cell || top_cell_is_reachable || left_cell_is_reachable)
end

sum_r_index_digits = Array.new(r) { |index| index.digits.sum }
sum_c_index_digits = Array.new(c) { |index| index.digits.sum }

grid = sum_r_index_digits.map.with_index do |row_sum, row_index|
  sum_c_index_digits.map.with_index do |column_sum, column_index|
    Cell.new row_index, column_index, row_sum + column_sum
  end
end

bottom_right_cell = grid.last.last
check_reachable_cell grid, bottom_right_cell.y, bottom_right_cell.x, t

result = grid.flatten.count(&:is_reachable)

# puts "answer"
puts result
