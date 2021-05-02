# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@sequence = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

depths = {}
depth  = 0
until @sequence.empty?
  @sequence.delete_prefix!(char = @sequence.chr)
  if char == '-'
    @sequence.delete_prefix!(char = @sequence.chr)
    (depths[char] ||= []).push depth
    depth -= 1
  else
    depth += 1
  end
end

depths.transform_values! do |value|
  value.sum { |v| Rational(1, v) }
end

puts depths.max_by(&:last)[0]
