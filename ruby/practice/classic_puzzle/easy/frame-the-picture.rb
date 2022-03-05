# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

frame_pattern = gets.chomp # the ASCII art pattern to use to frame the picture
# h: the height of the picture
# w: the width  of the picture
h, w = gets.split.collect(&:to_i)
lines = []
h.times do
  line = gets.chomp # the ASCII art picture line by line

  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def surround(grid, char)
  grid.map! { |row| [char, *row, char] }
  new_row = Array.new(grid.first.size, char)

  [new_row, *grid, new_row]
end

grid = lines.map { |row| row.ljust(w).chars }
[' ', *frame_pattern.chars.reverse].each do |frame_char|
  grid = surround(grid, frame_char)
end

results = grid.map(&:join)

# puts "Write framed picture line by line here"
results.each do |result|
  puts result
end
