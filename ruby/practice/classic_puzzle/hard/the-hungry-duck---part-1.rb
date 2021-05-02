# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@w, @h = gets.split.collect(&:to_i)
map = Array.new(@h) { Array.new(@w) { nil } }
@h.times do |h|
  inputs = gets.split
  (0..(@w - 1)).each do |j|
    food = inputs[j].to_i
    map[h][j] = food
  end
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

@h.times do |height|
  @w.times do |width|
    top  = height.zero? ? 0 : map[height - 1][width]
    left = width.zero?  ? 0 : map[height][width - 1]

    map[height][width] += [top, left].max
  end
end

puts map.last.last
