# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
inputs = gets.split
piles = []
(0...n).each do |i|
  c = inputs[i].to_i

  piles << c
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

piles.reject!(&:zero?)

same_configuration_index = 0
configurations = []

loop do
  configurations << piles.sort.join(' ')

  piles_size = piles.size
  piles = piles.map(&:pred).reject(&:zero?) << piles_size

  configuration = piles.sort.join(' ')

  if configurations.include? configuration
    same_configuration_index = configurations.index configuration
    break
  end
end

# puts "1"
puts configurations.size - same_configuration_index
