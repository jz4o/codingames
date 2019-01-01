# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
inputs = gets.split.map(&:to_i)

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
max_value = 0
max_diff  = 0
inputs.each.with_index do |input, index|
  break if index >= inputs.length - 1
  next if max_value >= input

  max_value = input

  diff = inputs[(index + 1)..-1].min - input
  max_diff = diff if max_diff > diff
end

puts max_diff
