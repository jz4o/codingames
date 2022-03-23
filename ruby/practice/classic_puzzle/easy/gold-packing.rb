# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = gets.to_i
n = gets.to_i
inputs = gets.split
bars = []
n.times do |i|
  bar = inputs[i].to_i

  bars << bar
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

combinations = []
(1..n).each do |i|
  combinations += bars.combination(i).to_a
end

combinations.filter! { |combination| combination.sum <= m }
max_sum = combinations.map(&:sum).max
combinations.filter! { |combination| combination.sum == max_sum }

result = combinations.first.join(' ')

# puts "7"
puts result
