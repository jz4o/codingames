# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
rows = []
n.times do
  x1, y1, x2, y2 = gets.split.map(&:to_i)
  rows << [x1, y1, x2, y2]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Point = Struct.new :y, :x
Line = Struct.new :y, :x, :b

lines = rows.map do |x1, y1, x2, y2|
  y = y2 - y1
  x = -(x2 - x1)
  b = (x2 - x1) * y1 - (y2 - y1) * x1

  Line.new y, x, b
end

points = lines.combination(2).filter_map do |line1, line2|
  denominator = (line1.y * line2.x - line2.y * line1.x).to_f
  next if denominator.zero?

  # add 0 to adjust -0.0 to 0.0
  y = (line1.b * line2.y - line2.b * line1.y) / denominator + 0
  x = (line1.x * line2.b - line2.x * line1.b) / denominator + 0

  Point.new y, x
end

points.uniq!
points.sort_by! do |point|
  [point.x, point.y]
end

results = []
results << points.size
results += points.map do |point|
  format_str = '%.3f'
  "#{format_str % point.x} #{format_str % point.y}"
end

# puts "0"
results.each do |result|
  puts result
end
