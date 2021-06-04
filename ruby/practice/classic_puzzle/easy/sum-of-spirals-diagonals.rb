# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

result = n.step(1, -2).flat_map do |side_length|
  base = n**2 - side_length**2 + 1
  side_length <= 1 ? base : (0...4).map { |i| i * (side_length - 1) + base }
end.sum

puts result
