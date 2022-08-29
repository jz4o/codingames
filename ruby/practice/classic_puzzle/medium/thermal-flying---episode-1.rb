# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width = gets.to_i
height = gets.to_i
t = gets.to_i
lines = []
height.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

grid = lines.map { |line| line.scan(/\.|V|-?\d/) }.reverse

v_y, v_x = nil
grid.each_with_index do |row, row_index|
  next unless row.include? 'V'

  v_y = row_index
  v_x = row.index 'V'
end

grid.each do |row|
  row.map!(&:to_i)
end

t.times do
  break if v_x.next == width
  break if v_y.zero?

  moved_x = v_x + 1
  moved_y = v_y - 1

  thermal = grid[moved_y][moved_x]
  moved_y += thermal

  break if height <= moved_y

  v_x = moved_x
  v_y = moved_y
end

# puts "answer"
puts "#{v_x} #{v_y}"
