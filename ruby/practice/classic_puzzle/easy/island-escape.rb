# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
elevation_rows = []
n.times do
  inputs = gets.split
  elevation_row = []
  n.times do |j|
    elevation = inputs[j].to_i
    elevation_row << elevation
  end
  elevation_rows << elevation_row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Cell = Struct.new :y, :x, :v
OCEAN_VALUE = 0

def include_ocean_cell?(cells)
  cells.any? { |cell| cell.v == OCEAN_VALUE }
end

grid = elevation_rows.map.with_index do |elevation_row, row_index|
  elevation_row.map.with_index do |elevation, value_index|
    Cell.new row_index, value_index, elevation
  end
end

center_index = n / 2
start_cell = grid[center_index][center_index]

reachable_cells = [start_cell]
be_check_cells = [start_cell]
while check_cell = be_check_cells.shift
  around_cells = [
    grid[check_cell.y - 1][check_cell.x],
    grid[check_cell.y][check_cell.x - 1],
    grid[check_cell.y][check_cell.x + 1],
    grid[check_cell.y + 1][check_cell.x]
  ].filter do |around_cell|
    (check_cell.v - 1..check_cell.v + 1).cover? around_cell.v
  end

  new_cells = around_cells - reachable_cells - be_check_cells

  reachable_cells.concat new_cells
  break if include_ocean_cell? new_cells

  be_check_cells.concat new_cells
end

result = include_ocean_cell?(reachable_cells) ? 'yes' : 'no'

# puts "maybe"
puts result
