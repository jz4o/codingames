# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height, mines, x, y, seed = gets.split.map(&:to_i)
# height.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "row"
# end

class Prng
  def initialize(seed)
    @last_value = seed
  end

  def generate
    @last_value = (((214_013 * @last_value + 2_531_011) % 2**32) / 65_536)
  end
end

MINE = '#'.freeze
EMPTY = '.'.freeze

prng = Prng.new seed

grid = Array.new(height + 2) { Array.new(width + 2) { EMPTY } }

mine_log = []
while mine_log.size < mines
  gen_x = (prng.generate % width) + 1
  gen_y = (prng.generate % height) + 1

  next if (x..(x + 2)).cover?(gen_x) && (y..(y + 2)).cover?(gen_y)
  next if mine_log.include? [gen_x, gen_y]

  mine_log << [gen_x, gen_y]

  grid[gen_y][gen_x] = MINE
end

mine_log.each do |mine_x, mine_y|
  ((mine_y - 1)..(mine_y + 1)).each do |target_y|
    ((mine_x - 1)..(mine_x + 1)).each do |target_x|
      target_value = grid[target_y][target_x]
      next if target_value == MINE

      grid[target_y][target_x] = (target_value.to_i + 1).to_s
    end
  end
end

results = grid[1...-1].map do |row|
  row[1...-1].join
end

results.each do |result|
  puts result
end
