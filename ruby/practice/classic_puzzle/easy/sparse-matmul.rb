# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_m, _n, _p = gets.split.map(&:to_i)
count_a, count_b = gets.split.map(&:to_i)
a_input_rows = []
count_a.times do
  row, column, value = gets.split
  row = row.to_i
  column = column.to_i
  value = value.to_f

  a_input_rows << [row, column, value]
end
b_input_rows = []
count_b.times do
  row, column, value = gets.split
  row = row.to_i
  column = column.to_i
  value = value.to_f

  b_input_rows << [row, column, value]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Cell = Struct.new :row, :column, :value

a_cells = a_input_rows.map { |row, column, value| Cell.new row, column, value }
b_cells = b_input_rows.map { |row, column, value| Cell.new row, column, value }

result_cell_hash = {}
result_cell_hash.default = 0
a_cells.each do |a_cell|
  b_cells.each do |b_cell|
    next if a_cell.column != b_cell.row

    result_cell_hash["#{a_cell.row},#{b_cell.column}"] += a_cell.value * b_cell.value
  end
end

result_cells = result_cell_hash.filter_map do |key, value|
  next if value.zero?

  row, column = key.split(',').map(&:to_i)
  Cell.new row, column, value
end

results = result_cells.sort_by { |cell| [cell.row, cell.column] }
                      .map { |cell| [cell.row, cell.column, cell.value].join(' ') }

# puts "row column value"
results.each do |result|
  puts result
end
