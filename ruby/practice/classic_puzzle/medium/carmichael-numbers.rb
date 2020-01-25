# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "YES|NO"

require 'prime'

prime_factors = @n.prime_division.flatten.select { |n| n.pred.positive? }
is_carmichael = @n.prime?.! && prime_factors.all? { |n| (@n.pred % n.pred).zero? }
puts is_carmichael ? 'YES' : 'NO'
