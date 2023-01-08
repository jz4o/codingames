# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

CARD_LANKS = ('2'..'10').to_a + %w[J Q K A]

decks = [[], []]
gets.to_i.times { decks.first << CARD_LANKS.index(gets.chomp.[](0..-2)) }
gets.to_i.times { decks.last  << CARD_LANKS.index(gets.chomp.[](0..-2)) }

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

def fight(deck1, deck2, index = 0)
  cards = [deck1[index], deck2[index]]
  raise unless cards.all?
  return fight deck1, deck2, index + 4 if cards.first == cards.last

  [cards.first < cards.last ? deck2 : deck1, index]
end

begin
  turn = 0
  until decks.any?(&:empty?) do
    turn += 1

    winner, index = fight decks.first, decks.last
    winner.push(*decks.first.shift(index + 1), *decks.last.shift(index + 1))
  end

  puts "#{decks.index(decks.max_by(&:length)) + 1} #{turn}"
rescue StandardError
  puts 'PAT'
end
