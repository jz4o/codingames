# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@r_1 = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "YES|NO"

is_success = false
@r_1.pred.downto(0) do |target|
  is_success = true and break if target + target.digits.sum == @r_1
end

puts is_success ? 'YES' : 'NO'

