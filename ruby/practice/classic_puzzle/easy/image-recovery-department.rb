# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h, _w = gets.split.map(&:to_i)
log_length = gets.to_i
diagnostic_log = gets.chomp
lines = []
h.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

diagnostic_logs = diagnostic_log.split
grid = lines.map(&:chars)
log_length.times do
  r, c, turn, radius = diagnostic_logs.pop(4).map(&:to_i)
  turn %= 4

  r_range = (r - radius)..(r + radius)
  c_range = (c - radius)..(c + radius)
  target_grid = grid[r_range].map { |row| row[c_range] }
  turn.times do
    # counterclockwise rotation
    target_grid = target_grid.transpose.reverse
  end

  r_range.each_with_index do |ri, i|
    grid[ri][c_range] = target_grid[i]
  end
end

results = grid.map(&:join)

# puts "Reconstructed Image."
results.each do |result|
  puts result
end
