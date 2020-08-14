# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
strengths = []
@n.times do
  v, e = gets.split(' ').collect(&:to_i)
  strengths << { v: v, e: e }
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "42"

puts strengths.flat_map.with_index(1) { |left, index|
  strengths[index..].map do |right|
    (right[:v] - left[:v]).abs + (right[:e] - left[:e]).abs
  end
}.reject(&:negative?).min
