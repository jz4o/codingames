# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b = gets.split.map(&:to_i)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

require 'prime'

xs = a.prime_division.map do |prime, count|
  exp = 1
  exp += 1 while prime**exp <= b
  max_exp = exp - 1

  (1..max_exp).sum { |e| b / prime**e } / count
end

result = xs.min

# puts "answer"
puts result
