# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

base = 2
step = 2
max = n
while base < max
  prev_max = max
  max = (max - base) / step * step + base

  base += step if prev_max == max

  step *= 2
end

# puts "answer"
puts max
