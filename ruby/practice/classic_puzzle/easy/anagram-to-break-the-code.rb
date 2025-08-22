# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = gets.chomp
s = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

words = s.downcase.gsub(/[:.,?!]/, ' ').split
sorted_words = words.map { |word| word.chars.sort.join }

downcase_w = w.downcase
sorted_w = downcase_w.chars.sort.join

key_index = words.zip(sorted_words).index { |word, sorted_word| word != downcase_w && sorted_word == sorted_w }

results = []
if key_index
  results << key_index % 10
  results << (sorted_words.size - key_index - 1) % 10
  results << sorted_words[...key_index].sum(&:length) % 10
  results << sorted_words[(key_index + 1)..].sum(&:length) % 10
else
  results << 'IMPOSSIBLE'
end

result = results.join '.'

# puts "answer"
puts result
