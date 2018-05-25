# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@start, @n = gets.split(" ").collect {|x| x.to_i}

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "42"

@n.times do
  binary = @start.to_s(2)
  zeros = binary.count('0') * :zero.size
  ones  = binary.count('1') * :one.size
  result = zeros + ones
  @start == result ? break : @start = result
end

puts @start

