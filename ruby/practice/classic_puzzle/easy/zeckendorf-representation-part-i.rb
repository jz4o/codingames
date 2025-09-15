# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

fibonacci_numbers = [1, 2]
while (next_fibonacci = fibonacci_numbers[-2..].sum) <= n
  fibonacci_numbers << next_fibonacci
end

zeckendorf_numbers = []
remain_number = n
until remain_number.zero?
  next_number_index = fibonacci_numbers.rindex { |number| number <= remain_number }
  next_number = fibonacci_numbers[next_number_index]

  zeckendorf_numbers << next_number
  remain_number -= next_number
end

result = zeckendorf_numbers.join '+'

# puts "representation"
puts result
