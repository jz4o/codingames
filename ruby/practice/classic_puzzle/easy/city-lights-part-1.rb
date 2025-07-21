# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = gets.to_i
w = gets.to_i
ss = []
h.times do
  s = gets.chomp
  ss << s
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Light = Struct.new :row_index, :column_index, :value
KIND_OF_NUMBER = 36

number_grid = ss.map do |d|
  d.chars.map do |v|
    v.to_i KIND_OF_NUMBER
  end
end

lights = number_grid.flat_map.with_index do |row, row_index|
  row.filter_map.with_index do |value, column_index|
    next nil if value.zero?

    Light.new row_index, column_index, value
  end
end

lights.each do |light|
  row_distance_range = -[light.row_index, light.value].min..[h - light.row_index - 1, light.value].min
  column_distance_range = -[light.column_index, light.value].min..[w - light.column_index - 1, light.value].min

  row_distance_range.each do |row_distance|
    column_distance_range.each do |column_distance|
      next if [row_distance, column_distance].all?(&:zero?)

      distance = Math.sqrt row_distance.abs**2 + column_distance.abs**2
      brightness = [(light.value - distance).round, 0].max
      number_grid[light.row_index + row_distance][light.column_index + column_distance] += brightness
    end
  end
end

results = number_grid.map do |row|
  row.map { |value| [value, KIND_OF_NUMBER - 1].min.to_s KIND_OF_NUMBER }.join.upcase
end

# puts "Bobville"
results.each do |result|
  puts result
end
