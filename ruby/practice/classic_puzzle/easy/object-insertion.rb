# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

Point = Struct.new(:y, :x)

a, b = gets.split.collect(&:to_i)
object_lines = []
a.times do
  object_line = gets.chomp

  object_lines << object_line
end
c, d = gets.split.collect(&:to_i)
grid = []
c.times do
  grid_line = gets.chomp

  grid << grid_line.chars
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

object_parts_points = []
object_lines.each_with_index do |object_line, line_index|
  object_line.chars.each_with_index do |char, char_index|
    object_parts_points << Point.new(line_index, char_index) if char == '*'
  end
end

putable_points = []
(0..(c - a)).each do |line_index|
  (0..(d - b)).each do |column_index|
    next unless object_parts_points.all? do |point|
      grid[line_index + point.y][column_index + point.x] == '.'
    end

    putable_points << Point.new(line_index, column_index)
  end
end

results = []

results << putable_points.size

if putable_points.size == 1
  putable_point = putable_points.first

  object_parts_points.each do |object_parts_point|
    y = putable_point.y + object_parts_point.y
    x = putable_point.x + object_parts_point.x

    grid[y][x] = '*'
  end

  results << grid.map(&:join)
end

# puts "answer"
results.each do |result|
  puts result
end
