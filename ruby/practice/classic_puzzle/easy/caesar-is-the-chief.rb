# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

text_to_decode = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

ALPHABET = ('A'..'Z').to_a.join

words = text_to_decode.split

result = nil
ALPHABET.size.times do
  result = words.join(' ') and break if words.include?('CHIEF')

  words.map! do |word|
    word.chars.map { |char| ALPHABET[ALPHABET.index(char).pred] }.join
  end
end

result ||= 'WRONG MESSAGE'

# puts "DecodedText:string(101)"
puts result
