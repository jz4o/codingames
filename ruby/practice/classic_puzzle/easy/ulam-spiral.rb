# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

require 'prime'

top_rows = []
bottom_rows = []

1.step(by: 2, to: n) do |i|
  top_row_right_value = i**2 + i + 2
  top_row_left_value = top_row_right_value + i - 1
  top_row = (top_row_right_value..top_row_left_value).to_a.reverse

  bottom_row_right_value = i**2
  bottom_row_left_value = bottom_row_right_value - i + 1
  bottom_row = (bottom_row_left_value..bottom_row_right_value).to_a

  (1..((n - i) / 2)).each do |j|
    inner_square_last_value = (i + (j - 1) * 2)**2
    outer_square_last_value = (i + (j * 2))**2

    bottom_row_left_value = outer_square_last_value - i - j * 3 + 1
    bottom_row_right_value = inner_square_last_value + j

    top_row_left_value = bottom_row_left_value - i
    top_row_right_value = bottom_row_right_value + i

    top_row.push top_row_right_value
    top_row.unshift top_row_left_value

    bottom_row.push bottom_row_right_value
    bottom_row.unshift bottom_row_left_value
  end

  top_rows.unshift top_row
  bottom_rows.push bottom_row
end

# remove trash row
top_rows.shift

number_grid = top_rows + bottom_rows

results = number_grid.map do |number_row|
  number_row.map { |number| number.prime? ? '#' : ' ' }.join(' ')
end

# puts "ROW"
results.each do |result|
  puts result
end
