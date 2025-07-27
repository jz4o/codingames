# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

numbers = [1]
count = 1
until numbers.include? n
  numbers = numbers.flat_map { |number| [number, number + 1, number - 1, number * 2] }.uniq

  count += 1
end

result = count.to_s

# puts "Good Luck!"
puts result
