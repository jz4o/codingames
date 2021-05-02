# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "sum"

puts((1..@n).sum { |n| (@n / n) * n })
