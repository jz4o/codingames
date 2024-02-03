# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
swaps = []
n.times do
  swap = gets.chomp
  swaps << swap
end
_length = gets.to_i
encoded_message = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

swap_hash = swaps.to_h { |swap| swap.split ' -> ' }

encoded_chars = encoded_message.delete('+').chars
decode_chars = []
stack = []
while char = encoded_chars.shift
  case char
  when '*'
    stack_char = stack.pop
    decode_chars << (swap_hash[stack_char] || stack_char)
  when '#'
    pop_size = encoded_chars.shift.to_i
    stack.pop pop_size
  when '%'
    stack.push nil if stack.size.odd?
    stack = stack.each_slice(2).to_a.transpose.flatten
    stack.pop if stack.last.nil?
  else
    stack << char
  end
end
decode_message = decode_chars.join

MAX_LENGTH = 75
results = "#{decode_message} ".scan(/.{,#{MAX_LENGTH}}\s/o).map(&:strip)

# puts "decoded_message"
results.each do |result|
  puts result
end
