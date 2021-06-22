# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

Point = Struct.new(:x, :y)

n = gets.to_i
points = []
xs = []
ys = []
n.times do
  x, y = gets.split.collect(&:to_i)

  points << Point.new(x, y)
  xs << x
  ys << y
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

# build grid
y_plus_length = [*ys.filter(&:positive?), 0].max.abs.next
y_minus_length = [*ys.filter(&:negative?), 0].min.abs.next
x_plus_length = [*xs.filter(&:positive?), 0].max.abs.next
x_minus_length = [*xs.filter(&:negative?), 0].min.abs.next

y_length = y_plus_length + y_minus_length + 1
x_length = x_plus_length + x_minus_length + 1
grid = Array.new(y_length) { Array.new x_length, '.' }

# draw lines
zero_point = Point.new(x_minus_length, y_plus_length)

grid[zero_point.y].map! { '-' }
grid.map! { |row| row.tap { |r| r[zero_point.x] = '|' } }
grid[zero_point.y][zero_point.x] = '+'

# draw points
points.each do |point|
  grid[zero_point.y - point.y][zero_point.x + point.x] = '*'
end

# puts "answer"
grid.each do |row|
  puts row.join
end
