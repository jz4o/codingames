# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m, n = gets.split.collect(&:to_i)
t = gets.to_i
inputs = gets.split
choices = []
(0...t).each do |i|
  choice = inputs[i].to_i
  choices << choice
end
grid = Array.new(m) { [0] * n }
grid.first.map!(&:next)
grid.last.map!(&:next)
grid = grid.transpose
grid.first.map!(&:next)
grid.last.map!(&:next)
t.times do
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  choice = choices.shift
  choice_index = choice.pred

  grid[choice_index].pop
  eat_index = grid[choice_index].size

  grid[choice_index][eat_index.pred] += 1 unless eat_index.zero?
  grid[choice_index.pred][eat_index] += 1 unless choice_index.zero? || grid[choice_index.pred][eat_index].nil?
  grid[choice_index.next][eat_index] += 1 unless choice_index.next == m || grid[choice_index.next][eat_index].nil?

  result = grid.flatten.sum

  # puts "perimeter"
  puts result
end
