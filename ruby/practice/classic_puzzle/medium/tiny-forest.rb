# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = gets.to_i
h = gets.to_i
rows = []
h.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Position = Struct.new :y, :x, :v

TREE = 'Y'.freeze
SEED = 'X'.freeze
GRASS = '.'.freeze
WALL = '#'.freeze

grid = rows.map { |row| "#{WALL * 3}#{row}#{WALL * 3}".chars }
3.times do
  grid.unshift [WALL] * (w + 6)
  grid.push [WALL] * (w + 6)
end

tree_positions = grid.flat_map.with_index do |row, row_index|
  row.filter_map.with_index do |value, value_index|
    Position.new row_index, value_index, value if value == TREE
  end
end

tree_positions.each do |tree_position|
  (-3..3).each do |row_distance|
    ((-3 + row_distance.abs)..(3 - row_distance.abs)).each do |column_distance|
      row_index = tree_position.y + row_distance
      column_index = tree_position.x + column_distance

      grid[row_index][column_index] = TREE unless grid[row_index][column_index] == WALL
    end
  end
end

before_tree_count = grid.flatten.count TREE

increase_tree_counts = (3...(h + 3)).flat_map do |row_index|
  (3...(w + 3)).map do |column_index|
    (-2..2).sum do |row_distance|
      ((-2 + row_distance.abs)..(2 - row_distance.abs)).count do |column_distance|
        grid[row_index + row_distance][column_index + column_distance] == GRASS
      end
    end
  end
end

result = before_tree_count + increase_tree_counts.max

# puts "number of trees"
puts result
