# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

map = []
@width, @height = gets.split.collect(&:to_i)
@height.times do
  map << gets.chomp.chars
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# move by gravity
map = map.transpose.map { |line| line.sort.reverse }

# output
map.transpose.each do |line|
  puts line.join
end
