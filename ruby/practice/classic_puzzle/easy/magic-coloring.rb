# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

x, y = gets.split.map(&:to_i)
lines = []
y.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Cell = Struct.new :y, :x, :v, :checked

temp_lines = lines.map { |line| "0#{line}0" }
temp_lines.unshift('0' * (x + 2))
temp_lines.push('0' * (x + 2))

grid = temp_lines.map.with_index do |line, line_index|
  line.chars.map.with_index do |value, value_index|
    Cell.new line_index, value_index, value.to_i, false
  end
end

cells = grid.flatten

number_of_color_blocks = (1..9).filter_map do |i|
  target_cells = cells.filter { |cell| cell.v == i }

  count = 0
  while (temp_cells = [target_cells.shift]).any?
    while temp_cell = temp_cells.shift
      temp_cell.checked = true
      around_cells = [
        grid[temp_cell.y - 1][temp_cell.x],
        grid[temp_cell.y][temp_cell.x - 1],
        grid[temp_cell.y][temp_cell.x + 1],
        grid[temp_cell.y + 1][temp_cell.x]
      ].filter { |cell| cell.v == temp_cell.v && !cell.checked }

      target_cells -= around_cells

      temp_cells.concat(around_cells - temp_cells)
    end

    count += 1
  end

  "#{i} -> #{count}" unless count.zero?
end

results = number_of_color_blocks.any? ? number_of_color_blocks : ['No coloring today']

# puts "answer"
results.each do |result|
  puts result
end
