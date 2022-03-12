# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
deck = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def faro_shuffle(deck)
  splited_deck = deck.split
  half_index = (splited_deck.size / 2.0).ceil
  front_half = splited_deck[...half_index]
  back_half = splited_deck[half_index..]

  front_half.zip(back_half).flatten.compact.join(' ')
end

result = deck
n.times { result = faro_shuffle result }

# puts "answer"
puts result
