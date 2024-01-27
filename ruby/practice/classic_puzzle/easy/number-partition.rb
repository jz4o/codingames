# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

temp_digits = (1..n).map { |i| [i] }
results = []
while temp_digits.any? do
  temp_digit = temp_digits.pop
  results << temp_digit.join(' ') and next if temp_digit.sum == n

  temp_digits += [n - temp_digit.sum, temp_digit.last].min.downto(1).map do |i|
    temp_digit + [i]
  end
end

results.sort!.reverse!

# puts "answer"
results.each do |result|
  puts result
end
