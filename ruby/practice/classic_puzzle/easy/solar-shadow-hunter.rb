# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_w, h = gets.split.map(&:to_i)
k = gets.to_i
rows = []
h.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

grid = rows.map(&:chars)
clockwise_grid = grid.transpose.map(&:reverse)

clockwise_grid.each do |row|
  row.reverse_each.with_index(1) do |value, index|
    next unless value.match?(/\d/)

    shadow_length = value.to_i * k
    row.fill('.', -index..[-index + shadow_length, -1].min)
  end
end

panel_count = clockwise_grid.flatten.count 'P'

result = panel_count * 100

# puts "result"
puts result
