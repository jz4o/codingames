# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s, p = gets.split.map(&:to_i)
lines = []
s.times do
  line = gets.chomp
  lines << line
end
xys = []
p.times do
  x, y = gets.split.map(&:to_i)
  xys << [x, y]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @colors = []
  end

  def add_color(color)
    @colors << color
  end

  def color
    mix_colors
  end

  private

  def mix_colors
    return Color::WHITE if @colors.empty?
    return Color::BLACK if @colors.any?(&:black?)

    r = (@colors.sum(&:r) / @colors.size.to_f).round
    g = (@colors.sum(&:g) / @colors.size.to_f).round
    b = (@colors.sum(&:b) / @colors.size.to_f).round

    Color.new r, g, b
  end
end

class Color
  attr_reader :r, :g, :b

  def initialize(r, g, b)
    @r = r
    @g = g
    @b = b
  end

  def black?
    [@r, @g, @b].all?(&:zero?)
  end

  def to_s
    "(#{@r}, #{@g}, #{@b})"
  end

  BLACK = Color.new 0, 0, 0
  WHITE = Color.new 255, 255, 255
end

points = xys.map do |x, y|
  Point.new x, y
end

lines.each do |line|
  name, x, y, len, r, g, b = line.split
  x, y, len, r, g, b = [x, y, len, r, g, b].map(&:to_i)
  c = Color.new r, g, b

  if name == 'SQUARE'
    min_x = x
    max_x = x + len
    min_y = y
    max_y = y + len

    points.filter { |point| (min_x..max_x).cover?(point.x) && (min_y..max_y).cover?(point.y) }
          .each do |point|
            color = [min_x, max_x].include?(point.x) || [min_y, max_y].include?(point.y) ? Color::BLACK : c
            point.add_color color
          end
  elsif name == 'CIRCLE'
    min_x = x - len
    max_x = x + len
    min_y = y - len
    max_y = y + len

    points.filter { |point| (min_x..max_x).cover?(point.x) && (min_y..max_y).cover?(point.y) }
          .each do |point|
            diff_x = (x - point.x).abs
            diff_y = (y - point.y).abs
            radius = Math.sqrt(diff_x**2 + diff_y**2)

            next if len < radius

            color = len == radius ? Color::BLACK : c
            point.add_color color
          end
  end
end

results = points.map do |point|
  point.color.to_s
end

# puts "answer"
results.each do |result|
  puts result
end
