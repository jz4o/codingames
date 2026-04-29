# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
s = gets.to_i
q = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

diff_sum = (1..n).sum - s
diff_square = (1..n).sum { |i| i**2 } - q

min_missing_number, max_missing_number = (1..(diff_sum / 2)).filter_map do |i|
  j = diff_sum - i

  [i, j] if i**2 + j**2 == diff_square
end.first

result = "#{min_missing_number} #{max_missing_number}"

# puts "answer"
puts result
