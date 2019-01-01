# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

cube_count = @n**3
invisible_cube_count = [@n - 2, 0].max**3
puts cube_count - invisible_cube_count
