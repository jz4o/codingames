# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_frame_length = gets.to_i
frame = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

FRAME_HEADER = 'DECAFBAD'.freeze

order_regexp = /(.{#{FRAME_HEADER.length}})(.{3})(.+?)(.)$/
header, size, order, _checksum = frame.match(order_regexp)&.captures || ([''] * 4)

is_valid_header = header == FRAME_HEADER
is_valid_size = size.to_i(16) == order.size
is_valid_checksum = frame.chars.sum { |c| c.to_i 16 } % 16 == 0
is_valid = is_valid_header && is_valid_size && is_valid_checksum

results =
  if is_valid
    order.chars.uniq.map do |o|
      "#{order.count o} #{o}"
    end
  else
    ['403 Forbidden']
  end

# puts "0xC0FFEE"
results.each do |result|
  puts result
end
