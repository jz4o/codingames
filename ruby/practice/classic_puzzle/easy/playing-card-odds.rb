# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r, s = gets.split.map(&:to_i)
removed_array = []
r.times do
  removed = gets.chomp
  removed_array << removed
end
sought_array = []
s.times do
  sought = gets.chomp
  sought_array << sought
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Card = Struct.new :rank, :suit

RANKS = '23456789TJQKA'.chars.freeze
SUITS = 'CDHS'.chars.freeze

cards = RANKS.flat_map do |rank|
  SUITS.map do |suit|
    Card.new rank, suit
  end
end

def applicable?(card, condition)
  condition_chars = condition.chars
  condition_ranks = condition_chars & RANKS
  condition_suits = condition_chars & SUITS

  is_applicable_rank = condition_ranks.empty? || condition_ranks.include?(card.rank)
  is_applicable_suit = condition_suits.empty? || condition_suits.include?(card.suit)

  is_applicable_rank && is_applicable_suit
end

remain_cards = cards.dup.delete_if do |card|
  removed_array.any? do |removed|
    applicable? card, removed
  end
end

sought_card = remain_cards.filter do |card|
  sought_array.any? do |sought|
    applicable? card, sought
  end
end

percentage = (sought_card.size.to_f / remain_cards.size * 100).round
result = "#{percentage}%"

# puts "2%"
puts result
