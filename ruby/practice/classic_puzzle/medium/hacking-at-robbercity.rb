# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

message1 = gets.chomp
message2 = gets.chomp
message3 = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

message1_binary_chars = message1.scan(/.{2}/).map { |hexadecimal_char| hexadecimal_char.to_i 16 }
message2_binary_chars = message2.scan(/.{2}/).map { |hexadecimal_char| hexadecimal_char.to_i 16 }
message3_binary_chars = message3.scan(/.{2}/).map { |hexadecimal_char| hexadecimal_char.to_i 16 }

nth_binary_chars_array = message1_binary_chars.zip(message2_binary_chars, message3_binary_chars)

message_binary_chars = nth_binary_chars_array.map do |nth_binary_chars|
  nth_binary_chars.inject(&:^)
end

message_chars = message_binary_chars.map(&:chr)

result = message_chars.join

# puts "clear message"
puts result
