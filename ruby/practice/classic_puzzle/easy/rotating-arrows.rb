# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = gets.split.collect(&:to_i)
x, y = gets.split.collect(&:to_i)
lines = []
h.times do
  line = gets.chomp # The line of w arrows represented by ascii char ^v<>
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Position
  ARROWS = %w[^ > v <].freeze

  def initialize(y, x, value)
    @y = y
    @x = x
    @value = value
  end

  def arrow_position
    case @value
    when '^' then [@y - 1, @x]
    when '>' then [@y, @x + 1]
    when 'v' then [@y + 1, @x]
    when '<' then [@y, @x - 1]
    end
  end

  def rotate_arrow!
    @value = ARROWS[ARROWS.index(@value).next % ARROWS.size]
  end

  def equal_position?(y, x)
    @y == y && @x == x
  end

  def overflow?
    @value == 'X'
  end
end

lines.map! { |line| "X#{line}X" }
lines.unshift 'X' * (w + 2)
lines.push 'X' * (w + 2)

grid = lines.map.with_index do |line, line_index|
  line.chars.map.with_index do |char, char_index|
    Position.new line_index, char_index, char
  end
end

x += 1
y += 1

current_position = grid[y][x]
result = 0

loop do
  current_position.rotate_arrow!
  arrow_y, arrow_x = current_position.arrow_position

  current_position = grid[arrow_y][arrow_x]
  result += 1

  break if current_position.equal_position?(y, x) || current_position.overflow?
end

# puts "0"
puts result
