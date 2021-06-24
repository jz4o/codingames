# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

n += 1
binary_length = n.to_s(2).length

result = (1..binary_length).sum do |i|
  div, mod = n.divmod(2**i)

  div * (2**i.pred) + [0, mod - (2**i.pred)].max
end

# puts "Number of 1s"
puts result
