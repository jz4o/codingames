# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = gets.to_i
player1_cards = []
m.times do
  card = gets.chomp
  player1_cards << card
end
n = gets.to_i
player2_cards = []
n.times do
  card = gets.chomp
  player2_cards << card
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Card
  attr_reader :rank, :suit

  def initialize(str)
    @rank = str[...-1]
    @suit = str[-1]
  end

  def high_precedence?(other)
    precedence = %w[S H D C]

    precedence.index(@suit) < precedence.index(other.suit)
  end
end

Player = Struct.new :name, :cards

player1_cards.map! { |card| Card.new card }
player2_cards.map! { |card| Card.new card }

players = [
  Player.new('Player 1', player1_cards),
  Player.new('Player 2', player2_cards)
]

turn_player_index = 0
deck_cards = []
while players.all? { |player| player.cards.any? }
  last_card = deck_cards.last

  new_card = players[turn_player_index].cards.shift
  deck_cards << new_card

  is_snap = last_card&.rank == new_card.rank
  turn_player_index ^= 1 and next unless is_snap

  is_win_turn_player = new_card.high_precedence? last_card
  turn_player_index ^= 1 unless is_win_turn_player

  players[turn_player_index].cards.concat deck_cards
  deck_cards.clear
end

win_player = players.find { |player| player.cards.any? }

results = [
  "Winner: #{win_player.name}",
  win_player.cards.size
]

# puts "Winner: Player 1/Player 2"
# puts "Number of cards"
results.each do |result|
  puts result
end
