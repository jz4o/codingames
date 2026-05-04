# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i # the number of cards on the table
rows = []
n.times do
  number, shading, color, shape = gets.split
  number = number.to_i

  rows << [number, shading, color, shape]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

NUMBERS = [1, 2, 3].freeze
SHADINGS = %w[OUTLINED STRIPED SOLID].freeze
COLORS = %w[RED GREEN PURPLE].freeze
SHAPES = %w[DIAMOND OVAL SQUIGGLE].freeze

Card = Struct.new :number, :shading, :color, :shape

def set?(cards)
  cards.size == 3 &&
    [1, 3].include?(cards.map(&:number).uniq.size) &&
    [1, 3].include?(cards.map(&:shading).uniq.size) &&
    [1, 3].include?(cards.map(&:color).uniq.size) &&
    [1, 3].include?(cards.map(&:shape).uniq.size)
end

table_cards = rows.map do |number, shading, color, shape|
  Card.new number, shading, color, shape
end

all_cards = NUMBERS.flat_map do |number|
  SHADINGS.flat_map do |shading|
    COLORS.flat_map do |color|
      SHAPES.map do |shape|
        Card.new(number, shading, color, shape)
      end
    end
  end
end

deck_cards = all_cards - table_cards

expect_cards =
  if table_cards.combination(3).any? { |cards| set? cards }
    deck_cards
  else
    card_combinations = table_cards.combination(2)
    deck_cards.filter do |deck_card|
      card_combinations.any? { |cards| set? [*cards, deck_card] }
    end
  end

result = (expect_cards.size / deck_cards.size.to_f).round(4).to_s.ljust 6, '0'

# puts "0.5000"
puts result
