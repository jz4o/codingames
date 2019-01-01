# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@start, @n = gets.split(' ').collect(&:to_i)

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "42"

ZERO_STRING_SIZE = :zero.size
ONE_STRING_SIZE  = :one.size

@n.times do
  binary = @start.to_s(2)
  zeros = binary.count('0') * ZERO_STRING_SIZE
  ones  = binary.count('1') * ONE_STRING_SIZE
  result = zeros + ones
  @start == result ? break : @start = result
end

puts @start
