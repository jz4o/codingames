# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
ms = []
n.times do
  m = gets.chomp
  ms << m
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Mass = Struct.new :row_index, :column_index, :value

mass_grid = ms.map.with_index do |row, row_index|
  row.chars.map.with_index do |value, column_index|
    Mass.new row_index, column_index, value
  end
end

candidate_mass_arrays = mass_grid.flatten.filter_map { |mass| [mass] if mass.value == 'a' }

result_array = nil
while candidate_mass_array = candidate_mass_arrays.shift
  last_mass = candidate_mass_array.last

  result_array = candidate_mass_array and break if last_mass.value == 'z'

  target_value = last_mass.value.next

  around_last_masses = [
    mass_grid.dig(last_mass.row_index - 1, last_mass.column_index),
    mass_grid.dig(last_mass.row_index, last_mass.column_index - 1),
    mass_grid.dig(last_mass.row_index, last_mass.column_index + 1),
    mass_grid.dig(last_mass.row_index + 1, last_mass.column_index)
  ]

  around_last_masses
    .filter { |mass| mass&.value == target_value }
    .each { |mass| candidate_mass_arrays << candidate_mass_array + [mass] }
end

result_grid = Array.new(n) { Array.new n, '-' }
result_array.each do |mass|
  result_grid[mass.row_index][mass.column_index] = mass.value
end

results = result_grid.map(&:join)

# puts "answer"
results.each do |result|
  puts result
end
