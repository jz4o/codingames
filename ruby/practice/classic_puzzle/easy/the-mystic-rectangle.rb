require 'bigdecimal'
require 'bigdecimal/util'

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

x, y = gets.split.collect(&:to_i)
u, v = gets.split.collect(&:to_i)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

x_distance = [(x - u).abs, 200 - (x - u).abs].min.to_d
y_distance = [(y - v).abs, 150 - (y - v).abs].min.to_d

result = 0
result += [x_distance, y_distance].min * 0.5
result += (y_distance - x_distance).abs * (x_distance < y_distance ? 0.4 : 0.3)

# puts "0.0"
puts result.to_f
