# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

require 'prime'

def next_prime(n)
  return 2 if n < 2

  temp_n = n.even? ? n.next : n + 2
  temp_n += 2 until temp_n.prime?

  temp_n
end

left = next_prime n
while (right = next_prime(left)) != left + 2
  left = right
end

result = "#{left} #{right}"

# puts "answer"
puts result
