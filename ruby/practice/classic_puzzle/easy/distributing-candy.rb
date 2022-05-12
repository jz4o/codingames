# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, m = gets.split.collect(&:to_i)
inputs = gets.split
xs = []
(0...n).each do |i|
  x = inputs[i].to_i
  xs << x
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

result = xs.sort.each_cons(m).to_a.map { |cons_xs| cons_xs.max - cons_xs.min }.min

# puts "answer"
puts result
