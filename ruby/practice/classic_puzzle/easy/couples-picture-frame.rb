# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

wife = gets.chomp
husband = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

frame_size = wife.length.lcm husband.length

wife_line_chars = (wife * (frame_size / wife.length)).chars
husband_line_chars = (husband * (frame_size / husband.length)).chars

frame_grid = Array.new(frame_size + 2) { Array.new(frame_size, ' ') }

frame_grid[0] = wife_line_chars
frame_grid[-1] = husband_line_chars

frame_grid = frame_grid.transpose
frame_grid.first[1...-1] = husband_line_chars
frame_grid.last[1...-1] = wife_line_chars
frame_grid = frame_grid.transpose

results = frame_grid.map(&:join)

# puts "The Picture Frame"
results.each do |result|
  puts result
end
