# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_w, h = gets.split.collect(&:to_i)
start_row, start_col = gets.split.collect(&:to_i)
n = gets.to_i
map_rows = []
n.times do
  h.times do
    map_row = gets.chomp
    map_rows << map_row
  end
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

EMPTY = '.'.freeze
WALL = '#'.freeze
TREASURE = 'T'.freeze

maps = map_rows.each_slice(h).map { |rows| rows.map(&:chars) }

maps.map! do |rows|
  rows.map! { |row| [EMPTY, *row, EMPTY] }
  rows.unshift [EMPTY] * rows.first.size
  rows.push [EMPTY] * rows.first.size
end

paths = maps.map do |rows|
  current_row = start_row + 1
  current_col = start_col + 1

  path_count = 0
  while current = rows[current_row][current_col]
    rows[current_row][current_col] = EMPTY # measures for loop
    path_count += 1

    case current
    when '^'
      current_row -= 1
    when 'v'
      current_row += 1
    when '<'
      current_col -= 1
    when '>'
      current_col += 1
    else
      break
    end
  end

  current == TREASURE ? path_count : -1
end
glory_maps = paths.filter_map.with_index { |path, index| [path, index] if path.positive? }
shortest_path_map_index = glory_maps.min&.last
result = shortest_path_map_index || 'TRAP'

# puts "mapIndex"
puts result
