# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

kind_of_number = n + 1
binary_length = n.to_s(2).length

result = binary_length.times.sum do |i|
  half_cycle = 2**i
  cycle = half_cycle * 2

  div, mod = kind_of_number.divmod cycle
  div * half_cycle + [mod - half_cycle, 0].max
end

# puts "Number of 1s"
puts result
