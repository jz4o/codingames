# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a = gets.to_i
b = gets.to_i
m = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

d_results = [0] # D[0] = 0

u = 0
r = 0
step = 0
loop do
  step += 1

  d = (a * d_results[step.pred] + b) % m
  d_results << d

  case d % 4
  when 0
    u += 1
  when 1
    u -= 1
  when 2
    r -= 1
  when 3
    r += 1
  end

  break if [u, r].all?(0)
end

result = step

# puts "result"
puts result
