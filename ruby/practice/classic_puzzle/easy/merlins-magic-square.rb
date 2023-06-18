# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

row1 = gets.chomp
row2 = gets.chomp
row3 = gets.chomp
all_buttons_pressed = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

FULL_BIT = '111111111'.to_i(2)
REVERSE_CENTER_BIT = '000010000'.to_i(2)
REVERSE_BITS = %w[
  0
  110110000
  111000000
  011011000
  100100100
  010111010
  001001001
  000110110
  000000111
  000011011
].map { |reverse_bit| reverse_bit.to_i(2) }

button_bit = [row1, row2, row3].join.delete(' ').tr('~*', '01').to_i(2)
all_buttons_pressed.chars.each do |button|
  button_bit ^= REVERSE_BITS[button.to_i]
end

result = REVERSE_BITS.index((FULL_BIT - button_bit) ^ REVERSE_CENTER_BIT)

# puts "answer (a single digit)"
puts result
