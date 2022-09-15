# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

x = gets.to_i
n = gets.to_i
inputs = gets.split
ms = []
(0...n).each do |i|
  m = inputs[i].to_i
  ms << m
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def w(l, m)
  (l - 1) * 6.5 / 100 * 10 * m
end

works = []
ms.sort.reverse.each_slice(x).with_index(1) do |brick_weights, l|
  works += brick_weights.map { |m| w(l, m) }
end

result = format('%.3f', works.sum)

# puts "answer"
puts result
