# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

inputs = gets.split
ws = []
10.times do |i|
  w = inputs[i].to_i

  ws << w
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

first_second, first_third, *, third_fifth, fourth_fifth = ws

sum = ws.sum / 4
third = sum - first_second - fourth_fifth
first = first_third - third
second = first_second - first
fifth = third_fifth - third
fourth = fourth_fifth - fifth

result = [first, second, third, fourth, fifth].join(' ')

# puts "answer"
puts result
