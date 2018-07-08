# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

WIDTH = @n * 4 - 1

upper_part = []
lower_part = []
(1..@n).each do |n|
  part = '*' * (n * 2 - 1)
  upper_part << part.center(WIDTH).rstrip

  space_part = ' ' * ((@n - n + 1) * 2 - 1)
  lower_part << [part, space_part, part].join.center(WIDTH).rstrip
end
upper_part[0][0] = '.'

puts upper_part + lower_part

