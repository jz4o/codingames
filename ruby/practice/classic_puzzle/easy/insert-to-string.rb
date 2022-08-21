# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = gets.chomp
change_count = gets.to_i
raw_changes = []
change_count.times do
  raw_change = gets.chomp
  raw_changes << raw_change
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Change = Struct.new :row_index, :column_index, :string

raw_changes.map! do |raw_change|
  row_index, column_index, string = raw_change.split('|')
  row_index = row_index.to_i
  column_index = column_index.to_i

  Change.new row_index, column_index, string
end

raw_changes.sort_by! { |change| [-change.row_index, -change.column_index] }

s_rows = s.split('\n')
raw_changes.each do |raw_change|
  s_rows[raw_change.row_index].insert(raw_change.column_index, raw_change.string)
end

results = s_rows.flat_map { |s_row| s_row.split('\n') }

# puts "answer"
results.each do |result|
  puts result
end
