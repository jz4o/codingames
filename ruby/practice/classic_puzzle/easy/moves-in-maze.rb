# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = gets.split.collect(&:to_i)
rows = []
h.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Position = Struct.new :y, :x

grid = rows.map(&:chars)

arive_positions = []
grid.each_with_index do |row, row_index|
  next unless row.include? 'S'

  arive_positions << Position.new(row_index, row.index('S'))
  break
end

replaceable_chars = ['S', '.']

step = 0
while arive_positions.any?
  temp_arive_positions = []

  arive_positions.each do |position|
    grid[position.y][position.x] = step.to_s(36).upcase if replaceable_chars.include? grid[position.y][position.x]

    around_positions = [
      Position.new((position.y.zero? ? h - 1 : position.y - 1), position.x), # top
      Position.new(position.y, (position.x.zero? ? w - 1 : position.x - 1)), # left
      Position.new(position.y, (position.x + 1) % w), # right
      Position.new((position.y + 1) % h, position.x)  # bottom
    ]

    temp_arive_positions += around_positions.filter { |pos| grid[pos.y][pos.x] == '.' }
  end

  arive_positions = temp_arive_positions
  step += 1
end

results = grid.map(&:join)

# puts "answer"
results.each do |result|
  puts result
end
