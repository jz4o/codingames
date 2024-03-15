# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l = gets.to_i
n = gets.to_i
inputs = gets.split
bs = []
n.times do |i|
  b = inputs[i].to_i
  bs << b
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

min = bs.min
max = bs.max

result = [l - min, max].max

# puts "answer"
puts result
