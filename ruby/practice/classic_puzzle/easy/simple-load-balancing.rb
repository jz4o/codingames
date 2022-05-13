# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
k = gets.to_i
inputs = gets.split
lis = []
(0...n).each do |i|
  li = inputs[i].to_i
  lis << li
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

i = k
while i.positive?
  lis.sort!

  size = [lis.count(lis.first), i].min

  lis[0, size] = [lis.first + 1] * size
  i -= size
end

result = lis.max - lis.min

# puts "answer"
puts result
