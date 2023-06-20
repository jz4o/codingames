# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

steps = gets.to_i
h = gets.to_i
w = gets.to_i
rows = []
h.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

grid = rows.map do |row|
  row.chars.map(&:ord)
end

steps.times do
  # move to down
  grid = grid.transpose
  grid.map! do |row|
    move_count = row.sum % h
    row.rotate(-move_count)
  end
  grid = grid.transpose

  # move to right
  grid.map! do |row|
    move_count = row.sum % w
    row.rotate(-move_count)
  end
end

results = grid.map do |row|
  row.map(&:chr).join
end

# puts "decrypted row"
results.each do |result|
  puts result
end
