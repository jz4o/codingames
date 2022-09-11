# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

bank_cards = gets.chomp
player_cards = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Hand
  attr_reader :point

  def initialize(cards)
    @cards = cards.split

    @card_points = @cards.map { |card| card.sub(/J|Q|K/, '10').sub('A', '1').to_i }

    @point = @card_points.sum
    @point += 10 if @card_points.include?(1) && @point <= 11
    @point = 0 if @point > 21
  end

  def burst?
    @point.zero?
  end

  def blackjack?
    @card_points == [1, 10]
  end
end

bank_hand = Hand.new(bank_cards)
player_hand = Hand.new(player_cards)

result =
  if player_hand.blackjack? && !bank_hand.blackjack?
    'Blackjack!'
  elsif player_hand.point < bank_hand.point || (bank_hand.burst? && player_hand.burst?)
    'Bank'
  elsif bank_hand.point < player_hand.point
    'Player'
  else
    'Draw'
  end

# puts "Blackjack!"
puts result
