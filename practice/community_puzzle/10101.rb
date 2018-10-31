# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@w = gets.to_i
@h = gets.to_i
grid = []
@h.times do
  row = gets.chomp
  grid << row.chars
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

def get_completed_row_or_column_count(grid)
  [
    grid.map           { |row| row.all? { |column| column == '#' } },
    grid.transpose.map { |row| row.all? { |column| column == '#' } }
  ].flatten.count(true)
end

scores = []
scores << get_completed_row_or_column_count(grid)
grid.each_with_index do |row, row_index|
  row.each_with_index do |column, column_index|
    # check block can placed?
    next unless grid.dig(row_index, column_index)           == '.' # target math
    next unless grid.dig(row_index, column_index.next)      == '.' # right math
    next unless grid.dig(row_index.next, column_index)      == '.' # bottom math
    next unless grid.dig(row_index.next, column_index.next) == '.' # bottom right math

    # grid with block placed.
    clone_grid = Marshal.load(Marshal.dump(grid))
    clone_grid[row_index][column_index]           = '#'
    clone_grid[row_index][column_index.next]      = '#'
    clone_grid[row_index.next][column_index]      = '#'
    clone_grid[row_index.next][column_index.next] = '#'

    # count columns and rows that could be completed.
    scores << get_completed_row_or_column_count(clone_grid)
  end
end

puts scores.max

