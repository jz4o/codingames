# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
results = []
@n.times do
  results << gets.chomp
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

puts results.min
