# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
lines = []
n.times do
  line = gets.chomp
  lines << line
end
# n.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "solved line"
# end

Cell = Struct.new :y, :x, :v

EMPTY = '.'.freeze
FILL = '#'.freeze
WALL = ' '.freeze

def get_around_cells(grid, y, x)
  ((y - 1)..(y + 1)).flat_map do |y_index|
    ((x - 1)..(x + 1)).map do |x_index|
      grid[y_index][x_index]
    end
  end
end

def fill_around_cells(grid, y, x, fill_value)
  ((y - 1)..(y + 1)).each do |y_index|
    ((x - 1)..(x + 1)).each do |x_index|
      grid[y_index][x_index] ||= fill_value
    end
  end
end

grid = Array.new(n) { [WALL, *[nil] * n, WALL] }
grid.unshift [WALL] * (n + 2)
grid.push [WALL] * (n + 2)

cells = lines.flat_map.with_index(1) do |line, line_index|
  line.chars.filter_map.with_index(1) do |value, value_index|
    Cell.new line_index, value_index, value.to_i unless [EMPTY, WALL].include? value
  end
end

while cells.any?
  (cells.size - 1).downto(0).each do |index|
    cell = cells[index]

    around_cells = get_around_cells grid, cell.y, cell.x
    fill_value =
      case cell.v
      when around_cells.count(FILL)
        EMPTY
      when around_cells.count { |ac| [FILL, nil].include? ac }
        FILL
      end

    next unless fill_value

    fill_around_cells grid, cell.y, cell.x, fill_value
    cells.delete_at index
  end
end

results = grid[1...-1].map { |result| result[1...-1].join }

results.each do |result|
  puts result
end
