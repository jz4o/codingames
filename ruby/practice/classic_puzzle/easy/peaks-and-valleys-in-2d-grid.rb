# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = gets.to_i
lines = []
h.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Point
  def initialize(y, x)
    @y = y
    @x = x
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end

grid = lines.map do |line|
  [nil, *line.split.map(&:to_i), nil]
end
grid.unshift([nil] * grid.first.size)
grid << [nil] * grid.first.size

peak_points = []
valley_points = []
grid.each_with_index do |row, row_index|
  row.each_with_index do |value, column_index|
    next if value.nil?

    around_values = grid[(row_index - 1)..(row_index + 1)]
                    .flat_map { |r| r[(column_index - 1)..(column_index + 1)] }
                    .filter { |v| v }

    next unless around_values.one? value

    point = Point.new row_index - 1, column_index - 1

    peak_points << point if around_values.max == value
    valley_points << point if around_values.min == value
  end
end

results = [
  peak_points.any? ? peak_points.join(', ') : 'NONE',
  valley_points.any? ? valley_points.join(', ') : 'NONE'
]

# puts "Peak Coordinates or None"
# puts "Valley Coordinates or None"
results.each do |result|
  puts result
end
