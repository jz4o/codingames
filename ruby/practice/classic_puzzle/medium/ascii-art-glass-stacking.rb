# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

stage = 0
@n -= stage += 1 while @n >= stage.next

GLASS_PARTS = [
  ' *** ',
  ' * * ',
  ' * * ',
  '*****'
].freeze
WIDTH = stage * GLASS_PARTS.first.size + stage.pred

(1..stage).each do |step|
  GLASS_PARTS.each do |glass_part|
    puts [glass_part].*(step).join(' ').center(WIDTH)
  end
end
