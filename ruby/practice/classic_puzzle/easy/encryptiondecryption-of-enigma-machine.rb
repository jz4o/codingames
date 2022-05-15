# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

operation = gets.chomp
pseudo_random_number = gets.to_i
rotors = []
3.times do
  rotor = gets.chomp
  rotors << rotor
end
message = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

ALPHABET = ('A'..'Z').to_a.join.freeze

if operation == 'ENCODE'
  message_chars = message.chars.map.with_index do |char, index|
    ALPHABET[(ALPHABET.index(char) + pseudo_random_number + index) % ALPHABET.size]
  end

  rotors.each do |rotor|
    message_chars.map! { |char| rotor[ALPHABET.index(char)] }
  end
else
  message_chars = message.chars

  rotors.reverse_each do |rotor|
    message_chars.map! { |char| ALPHABET[rotor.index(char)] }
  end

  message_chars = message_chars.map.with_index do |char, index|
    ALPHABET[(ALPHABET.index(char) - pseudo_random_number - index) % ALPHABET.size]
  end
end

result = message_chars.join

# puts "message"
puts result
