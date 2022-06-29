# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b, c = gets.split.collect(&:to_f)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Point
  attr_reader :x, :y

  DECIMALS_DIGITS = 2

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    formatted_x = x.round(DECIMALS_DIGITS).to_s.sub(/\.?0+$/, '')
    formatted_y = y.round(DECIMALS_DIGITS).to_s.sub(/\.?0+$/, '')

    "(#{formatted_x},#{formatted_y})"
  end
end

delta = b**2 - (4 * a * c)

points = []

# x axis
unless a.zero? && b.zero?
  if a.zero?
    points << Point.new(-c.fdiv(b), 0.0)
  elsif delta.zero?
    points << Point.new(-b.fdiv(2 * a), 0.0)
  elsif delta.positive?
    points << Point.new((-b + Math.sqrt(delta)).fdiv(2 * a), 0.0)
    points << Point.new((-b - Math.sqrt(delta)).fdiv(2 * a), 0.0)
  end
end

# y axis
points << Point.new(0.0, c)

result = points.sort_by { |point| [point.x, point.y] }.join(',')

# puts "(X1,Y1),...,(Xn,Yn)"
puts result
