# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

side_size = gets.to_i
rows = []
side_size.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

quad_values = Array.new(4, 0)
rows.each_with_index do |row, row_index|
  row.chars.each_with_index do |value, value_index|
    quad_index = (row_index / (side_size / 2) * 2) + (value_index / (side_size / 2))
    quad_values[quad_index] += value.to_i unless value == '.'
  end
end

standard_value = quad_values.sort[1]
odd_value = (quad_values - [standard_value]).first
odd_quad = quad_values.index(odd_value) + 1

results = [
  "Quad-#{odd_quad} is Odd-Quad-Out",
  "It has value of #{odd_value}",
  "Others have value of #{standard_value}"
]

# puts "the number of the Odd Quadrant Out"
# puts "write value of the Odd Quadrant Out"
# puts "write value of the other Quadrants"
results.each do |result|
  puts result
end
