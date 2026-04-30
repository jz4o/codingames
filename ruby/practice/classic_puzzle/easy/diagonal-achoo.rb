# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
g = gets.to_i
rows_array = []
g.times do
  rows = []
  n.times do
    row = gets.chomp
    rows << row
  end
  rows_array << rows
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

NORMAL_PERSON = '.'.freeze
HEALTHY_PERSON = 'H'.freeze
CONTAGIOUS_PERSON = 'C'.freeze

Cell = Struct.new :y, :x, :v

grids = rows_array.map do |rows|
  rows.map(&:chars)
end

infected_grids = grids.map do |grid|
  grid = grid.map { |row| [HEALTHY_PERSON, *row, HEALTHY_PERSON] }
  grid.unshift([HEALTHY_PERSON] * (n + 2))
  grid.push([HEALTHY_PERSON] * (n + 2))

  grid = grid.map.with_index do |row, row_index|
    row.map.with_index do |value, column_index|
      Cell.new row_index, column_index, value
    end
  end

  cells_to_check = grid.flatten.filter do |cell|
    cell.v == CONTAGIOUS_PERSON
  end

  checked_cells = []
  while cells_to_check.any?
    target_cell = cells_to_check.pop
    checked_cells << target_cell

    next_check_cells = [
      grid[target_cell.y - 1][target_cell.x - 1],
      grid[target_cell.y - 1][target_cell.x + 1],
      grid[target_cell.y + 1][target_cell.x - 1],
      grid[target_cell.y + 1][target_cell.x + 1]
    ].filter { |cell| cell.v == NORMAL_PERSON }

    next_check_cells.each do |cell|
      cell.v = CONTAGIOUS_PERSON
    end

    cells_to_check += (next_check_cells - cells_to_check - checked_cells)
  end

  grid[1...-1].map do |row|
    row[1...-1]
  end
end

most_infected_grid_index = g.times.max_by do |i|
  infected_grids[i].flatten.count { |cell| cell.v == CONTAGIOUS_PERSON }
end
most_infected_grid_value_rows = infected_grids[most_infected_grid_index].map do |row|
  row.map(&:v).join
end

results = []
results << most_infected_grid_index
results += most_infected_grid_value_rows

# puts "Index (starts from 0)"
# puts "C.C."
# puts ".C.C"
# puts "C.H."
# puts ".C.."
results.each do |result|
  puts result
end
