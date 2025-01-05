# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

c = gets.chomp
m = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

complex_c = Complex(c)

f = 0
n = 0
while f.abs < 2 && n < m
  f = f**2 + complex_c
  n += 1
end

result = n

# puts "answer"
puts result
