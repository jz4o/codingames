# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

digits = [0, *@n.digits.reverse]

decrement_index = digits.rindex { |digit| !digit.zero? }
digits[decrement_index] -= 1

increment_index = digits[0...decrement_index].rindex { |digit| digit != 9 }
digits[increment_index] += 1

digits[increment_index.next..-1] = digits[increment_index.next..-1].sort

# puts "11"
puts digits.join.to_i
