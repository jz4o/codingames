# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

texts = []
6.times do
  text = gets.chomp
  texts << text
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Position = Struct.new :y, :x, :value

TREE = '#'.freeze
CUT_DOWN_TREE = '='.freeze
EMPTY = 'o'.freeze
FIRE = '*'.freeze

texts.map! { |text| [EMPTY, EMPTY, text, EMPTY, EMPTY].join }
texts.unshift EMPTY * texts.first.size
texts.unshift EMPTY * texts.first.size
texts.push EMPTY * texts.first.size
texts.push EMPTY * texts.first.size

positions = texts.flat_map.with_index do |text, text_index|
  text.chars.map.with_index do |char, char_index|
    Position.new text_index, char_index, char
  end
end

before_tree_size = positions.count { |position| position.value == TREE }

fire_positions = positions.filter { |position| position.value == FIRE }
fire_positions.each do |fire_position|
  positions.each do |position|
    next unless position.value == TREE
    next unless ((fire_position.y - 2)..(fire_position.y + 2)).cover?(position.y)
    next unless ((fire_position.x - 2)..(fire_position.x + 2)).cover?(position.x)

    position.value = CUT_DOWN_TREE
  end
end

after_tree_size = positions.count { |position| position.value == TREE }

result =
  if fire_positions.size.zero?
    'RELAX'
  elsif after_tree_size.zero?
    'JUST RUN'
  else
    before_tree_size - after_tree_size
  end

# puts "12"
puts result
