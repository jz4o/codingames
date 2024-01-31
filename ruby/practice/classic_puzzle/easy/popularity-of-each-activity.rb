# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

height = gets.to_i
rows = []
height.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

split_column_indexes = rows.first.chars.filter_map.with_index { |value, index| index if value == ':' }
split_row_indexes = rows.filter_map.with_index { |row, index| index if row.start_with? '-' }

attendees_grid = Array.new(3) { Array.new(3, 0) }
rows.each_with_index do |row, row_index|
  grid_row = split_row_indexes.index { |split_row_index| row_index < split_row_index } || 2

  row.chars.each_with_index do |value, column_index|
    next unless value == '*'

    grid_column = split_column_indexes.index { |split_column_index| column_index < split_column_index } || 2

    attendees_grid[grid_row][grid_column] += 1
  end
end

total_attendees = rows.join.count '*'
attendees_percentage_rows = attendees_grid.map do |attendees_row|
  attendees_row.map do |attendees|
    percentage = attendees.to_f / total_attendees * 100
    "#{percentage.round.to_s.rjust(3, '_')}%"
  end.join ' '
end

results = []
results << "#{total_attendees} attendees"
results += attendees_percentage_rows

# puts "total, and popularity of each"
results.each do |result|
  puts result
end
