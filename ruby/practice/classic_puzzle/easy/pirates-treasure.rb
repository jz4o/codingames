# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@w = gets.to_i
@h = gets.to_i
map = []
map << Array.new(@w + 2, 1)
@h.times do
  line = gets.chomp
  map << [1, *line.split.map(&:to_i), 1]
end
map << Array.new(@w + 2, 1)

treasure_index = nil
catch :map_loop do
  map[1..-2].each.with_index(1) do |line, line_index|
    line[1..-2].each.with_index(1) do |math, math_index|
      next unless map[line_index.pred][math_index.pred, 3].all?(1)
      next unless line[math_index.pred].pred.zero?
      next unless math.zero?
      next unless line[math_index.next].pred.zero?
      next unless map[line_index.next][math_index.pred, 3].all?(1)

      treasure_index = [math_index.pred, line_index.pred].join(' ')

      throw :map_loop
    end
  end
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "x y"

puts treasure_index
