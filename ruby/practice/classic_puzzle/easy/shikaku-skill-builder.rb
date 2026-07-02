# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = gets.split.map(&:to_i)
grid = []
h.times do
  inputs = gets.split
  row = []
  w.times do |j|
    n = inputs[j].to_i
    row << n
  end

  grid << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Cell = Struct.new :row, :column, :value

number_cells = grid.flat_map.with_index do |row, row_index|
  row.filter_map.with_index do |value, column_index|
    Cell.new row_index, column_index, value unless value.zero?
  end
end

results = number_cells.flat_map do |cell|
  cell_results = (1..cell.value).flat_map do |width|
    next [] unless (cell.value % width).zero?

    height = cell.value / width

    min_row_index = [cell.row - height + 1, 0].max
    max_row_index = [h - height, cell.row].min
    min_column_index = [cell.column - width + 1, 0].max
    max_column_index = [w - width, cell.column].min

    (min_row_index..max_row_index).flat_map do |row_index|
      (min_column_index..max_column_index).filter_map do |column_index|
        values = grid[row_index, height].flat_map { |row| row[column_index, width] }
        next if values.sum != cell.value

        [row_index, column_index, width, height]
      end
    end
  end
  next [] if cell_results.empty?

  cell_results
    .sort_by! { |row_index, column_index| [row_index, column_index] }
    .map! { |cell_result| cell_result.join ' ' }

  [
    [cell.row, cell.column, cell.value].join(' '),
    *cell_results
  ]
end

# puts "answer"
results.each do |result|
  puts result
end
