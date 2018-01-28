# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

CARD_LANKS = ('2'..'10').to_a + ['J', 'Q', 'K', 'A']

decks = [[],[]]
gets.to_i.times { decks.first << CARD_LANKS.index(gets.chomp.[](0..-2)) }
gets.to_i.times { decks.last  << CARD_LANKS.index(gets.chomp.[](0..-2)) }

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

def fight(deck1, deck2, index = 0)
  cards = [deck1[index], deck2[index]]
  raise unless cards.all?

  if cards.first == cards.last
    return fight deck1, deck2, index + 4
  else
    return cards.first < cards.last ? deck2 : deck1, index
  end
end

begin
  turn = 0
  until decks.any?{ |card| card.length.zero? } do
    turn += 1

    winner, index = fight decks.first, decks.last
    winner.push *(decks.first.shift(index+1)), *(decks.last.shift(index+1))
  end

  puts "#{decks.index(decks.max{|card| card.length}) + 1} #{turn}"
rescue
  puts 'PAT'
end

