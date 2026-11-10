# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
inputs = gets.split
cards = []
n.times do |i|
  card = inputs[i]
  cards << card
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

temp_cards = cards.dup
results = []
while temp_cards.any?
  results.rotate!(-1)
  results.unshift temp_cards.pop
end

result = results.join ' '

# puts "answer"
puts result
