# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
lines = []
n.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Cell = Struct.new :row, :column, :height, :hold, :is_overflow, :is_holded
ALPHABETS = ('A'..'Z').to_a

grid = lines.map.with_index do |line, row_index|
  line.chars.map.with_index do |value, column_index|
    Cell.new row_index, column_index, ALPHABETS.index(value) + 1, 0, false, false
  end
end

grid.first.each do |cell|
  cell.is_overflow = true
end
grid.last.each do |cell|
  cell.is_overflow = true
end
grid.each do |row|
  row.first.is_overflow = true
  row.last.is_overflow = true
end

overflow_cells = grid.flatten.filter(&:is_overflow)
overflow_cells_to_checks = overflow_cells.dup
while cell = overflow_cells_to_checks.shift
  around_cell = [
    grid[[cell.row - 1, 0].max][cell.column],
    grid[cell.row][[cell.column - 1, 0].max],
    grid[cell.row][[cell.column + 1, n - 1].min],
    grid[[cell.row + 1, n - 1].min][cell.column]
  ].filter { |c| !c.is_overflow && cell.height <= c.height }

  next_overflow_cells_to_checks = around_cell - overflow_cells_to_checks - overflow_cells
  next_overflow_cells_to_checks.each { |c| c.is_overflow = true }

  overflow_cells_to_checks.concat next_overflow_cells_to_checks
  overflow_cells.concat next_overflow_cells_to_checks
end

hold_cells = overflow_cells.uniq.dup.sort_by(&:height)
hold_cells.each { |cell| cell.is_holded = true }
hold_cells_to_checks = hold_cells.dup
while cell = hold_cells_to_checks.shift
  around_cell = [
    grid[[cell.row - 1, 0].max][cell.column],
    grid[cell.row][[cell.column - 1, 0].max],
    grid[cell.row][[cell.column + 1, n - 1].min],
    grid[[cell.row + 1, n - 1].min][cell.column]
  ]

  next_checks = around_cell.filter { |c| !c.is_holded && c.height <= cell.height }
  next_checks.each do |c|
    c.hold = [cell.height - c.height, 0].max
    c.height = cell.height
    c.is_holded = true

    hold_cells_to_checks.unshift c
  end

  around_cell
    .filter { |c| cell.height < c.height }
    .each do |c|
      c.is_overflow = true
      c.is_holded = true

      insert_index = hold_cells_to_checks.index { |cc| c.height <= cc.height } || hold_cells_to_checks.size
      hold_cells_to_checks.insert(insert_index, c)
    end
end

result = grid.flatten.sum(&:hold)

# puts "volume"
puts result
