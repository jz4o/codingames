# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l = gets.to_i
w = gets.to_i
d = gets.to_i
n = gets.to_i
input_rows = []
n.times do
  s = gets.chomp
  input_rows << s
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Light = Struct.new :depth_index, :row_index, :column_index, :value
KIND_OF_NUMBER = 36

cube = []
temp_rows = input_rows.dup
while (rows = temp_rows.shift(w)).any?
  cube << rows.map do |row|
    row.chars.map { |v| v.to_i KIND_OF_NUMBER }
  end

  temp_rows.shift
end

lights = []
cube.each_with_index do |grid, depth|
  grid.each_with_index do |row, row_index|
    row.each_with_index do |value, column_index|
      next if value.zero?

      lights << Light.new(depth, row_index, column_index, value)
    end
  end
end

lights.each do |light|
  depth_distance_range = -[light.depth_index, light.value].min..[d - light.depth_index - 1, light.value].min
  row_distance_range = -[light.row_index, light.value].min..[w - light.row_index - 1, light.value].min
  column_distance_range = -[light.column_index, light.value].min..[l - light.column_index - 1, light.value].min

  depth_distance_range.each do |depth_distance|
    row_distance_range.each do |row_distance|
      column_distance_range.each do |column_distance|
        next if [depth_distance, row_distance, column_distance].all?(&:zero?)

        distance = Math.sqrt(depth_distance.abs**2 + row_distance.abs**2 + column_distance.abs**2).round
        brightness = [light.value - distance, 0].max

        target_depth_index = light.depth_index + depth_distance
        target_row_index = light.row_index + row_distance
        target_column_index = light.column_index + column_distance
        cube[target_depth_index][target_row_index][target_column_index] += brightness
      end
    end
  end
end

results = []
cube.each do |grid|
  grid.each do |row|
    results << row.map { |v| [v, KIND_OF_NUMBER - 1].min.to_s KIND_OF_NUMBER }.join.upcase
  end
  results << ''
end
results.pop

# puts "Bobville"
results.each do |result|
  puts result
end
