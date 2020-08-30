# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@m = gets.to_i
@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

distances = [@m - 1, @n - 1]

# one way city
if distances.min <= 0
  puts 1
  return
end

mole_combination = ((distances.max + 1)..distances.sum).inject { |n, sum| sum * n }
deno_combination = (1..distances.min).inject { |n, sum| sum * n }

movable_combination = mole_combination / deno_combination
significant_digits  = movable_combination.to_s.[](0...1000)

puts significant_digits
