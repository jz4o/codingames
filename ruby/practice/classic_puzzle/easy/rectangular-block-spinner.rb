# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@size = gets.to_i
@angle = gets.to_i
map = []
@size.times do
  line = gets.chomp
  map << line.split
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

DIAGONAL_SIZE = @size * 2 - 1

rotate_count = ((@angle - 45) % 360) / 90
rotate_count.times do
  map = map.transpose.reverse
end

diamond_map = []
(1..DIAGONAL_SIZE).each do |time|
  start = [0, time - @size].max
  size  = [time, @size * 2 - time].min

  diamond_map << []

  size.times do |s|
    diamond_map.last << map[start + s].pop
  end
end

diamond_map.each do |line|
  puts line.join(' ').center(DIAGONAL_SIZE)
end
