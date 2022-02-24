# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

number = gets.to_i
d = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

digits = number.digits.reverse

result = nil
((digits.size - 2)..digits.size).reverse_each do |size|
  numbers = digits.combination(size).map { |c| c.join.to_i }.uniq
  result = numbers.filter { |n| (n % d).zero? }.max

  break unless result.nil?
end

result ||= 0

# puts "answer"
puts result
