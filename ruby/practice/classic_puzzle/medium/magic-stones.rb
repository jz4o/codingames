# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
inputs = gets.split
stones = (0...@n).map { |i| inputs[i].to_i }

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "1"

stone_count = 0
levels = stones.uniq.sort
while level = levels.shift
  target_stone_count = stones.count level
  next_level_stone_count, target_stone_count = target_stone_count.divmod 2
  stones.delete level

  unless next_level_stone_count.zero?
    stones += [level.next] * next_level_stone_count
    levels.unshift level.next
  end
  stone_count += target_stone_count
end

puts stone_count
