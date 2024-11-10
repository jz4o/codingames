# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
rows = []
n.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

ISLAND = '#'.freeze
WATER = '~'.freeze
EMPTY = '.'.freeze

Cell = Struct.new :y, :x, :v

rows.map! { |row| "#{EMPTY}#{row}#{EMPTY}" }
rows.unshift EMPTY * (n + 2)
rows.push EMPTY * (n + 2)

grid = rows.map.with_index do |row, row_index|
  row.chars.map.with_index do |value, value_index|
    Cell.new row_index, value_index, value
  end
end

be_check_islands = grid.flatten.filter { |cell| cell.v == ISLAND }
island_groups = []
while check_island = be_check_islands.shift
  new_island_group = []
  be_check_group_islands = [check_island]
  while check_group_island = be_check_group_islands.shift
    new_island_group << check_group_island

    around_islands = [
      grid[check_group_island.y - 1][check_group_island.x],
      grid[check_group_island.y][check_group_island.x - 1],
      grid[check_group_island.y][check_group_island.x + 1],
      grid[check_group_island.y + 1][check_group_island.x]
    ].filter { |cell| cell.v == ISLAND }

    be_check_group_islands += (around_islands - new_island_group - be_check_group_islands)
  end

  island_groups << new_island_group

  be_check_islands -= new_island_group
end

coast_lengths = island_groups.map do |island_group|
  waters = island_group.flat_map do |island|
    [
      grid[island.y - 1][island.x],
      grid[island.y][island.x - 1],
      grid[island.y][island.x + 1],
      grid[island.y + 1][island.x]
    ].filter { |cell| cell.v == WATER }
  end

  waters.uniq.size
end

longest_coast = coast_lengths.max
island_index = coast_lengths.index(longest_coast) + 1

result = "#{island_index} #{longest_coast}"

# puts "answer"
puts result
