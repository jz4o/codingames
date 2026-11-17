# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rows = []
11.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

BEADS_ROW_RANGES = {
  top: 2..3,
  bottom: 5..9
}.freeze
POINT_ROW = 4
BEADS_COLUMNS = (5..53).step(4).to_a

transposed_rows = rows.map(&:chars).transpose.map(&:join)

digits = BEADS_COLUMNS.map do |column_index|
  transposed_row = transposed_rows[column_index]
  top = transposed_row[BEADS_ROW_RANGES[:top]].reverse.index('|') * 5
  bottom = transposed_row[BEADS_ROW_RANGES[:bottom]].index('|')

  top + bottom
end

point_index = BEADS_COLUMNS.find_index do |column_index|
  transposed_rows[column_index][POINT_ROW] == '.'
end
digits.insert point_index + 1, '.'

result_number = digits.join
result_number = result_number.sub(/^0+/, '0').sub(/^0(?!\.)/, '')
result_number = result_number.sub(/(\.\d*?)0+$/) { $1 }.delete_suffix('.')

result = result_number.to_s

# puts "value?"
puts result
