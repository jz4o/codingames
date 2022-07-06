# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, _m = gets.split.collect(&:to_i)
ts = []
n.times do
  t = gets.chomp
  ts << t
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Position = Struct.new :y, :x, :v
Snake = Struct.new :parts_size

HEAD_VALUE = 'o'.freeze
HORIZONTAL_VALUE = '-'.freeze
VERTICAL_VALUE = '|'.freeze
CURVE_VALUE = '*'.freeze
TAIL_VALUES = %w[v < > ^].freeze
SEARCH_DIRECTIONS = %i[top right left bottom].freeze

grid = ts.map(&:chars)

tail_positions = grid.flat_map.with_index do |row, row_index|
  row.filter_map.with_index do |value, value_index|
    Position.new(row_index, value_index, value) if TAIL_VALUES.include? value
  end
end

snakes = []
tail_positions.each do |tail_position|
  search_direction = SEARCH_DIRECTIONS[TAIL_VALUES.index tail_position.v]
  position = tail_position

  parts_size = 1
  until position.v == HEAD_VALUE
    case search_direction
    when :top
      position.y -= 1
    when :right
      position.x += 1
    when :left
      position.x -= 1
    when :bottom
      position.y += 1
    end

    position.v = grid[position.y][position.x]

    parts_size += 1

    next unless position.v == CURVE_VALUE

    case search_direction
    when :top, :bottom
      left_x = [position.x.pred, 0].max
      search_direction = grid[position.y][left_x] == HORIZONTAL_VALUE ? :left : :right
    when :right, :left
      top_y = [position.y.pred, 0].max
      search_direction = grid[top_y][position.x] == VERTICAL_VALUE ? :top : :bottom
    end
  end

  snakes << Snake.new(parts_size)
end

max_size = snakes.map(&:parts_size).max
max_size_count = snakes.count { |snake| snake.parts_size == max_size }

results = []
results << max_size
results << max_size_count

# puts "Answer"
results.each do |result|
  puts result
end
