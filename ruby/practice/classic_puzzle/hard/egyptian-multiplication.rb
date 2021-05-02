# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@a, @b = gets.split.collect(&:to_i)

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

high = [@a, @b].max
low = @a + @b - high

# initial formula
puts "#{high} * #{low}"

add_nums = ''
until low.zero? do
  if low.even?
    high *= 2
    low /= 2
  else
    add_nums << " + #{high}"
    low = low.pred
  end

  # way formula
  puts "= #{high} * #{low}#{add_nums}"
end

# answer
puts "= #{@a * @b}"
