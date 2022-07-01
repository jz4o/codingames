# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

text = gets.chomp
n = gets.to_i
words = []
n.times do
  word = gets.chomp
  words << word
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

text_chars = text.downcase.delete('^a-z').chars

text_char_count = text_chars.sort.chunk { |char| char }.to_h.transform_values(&:size)
text_char_count.default = 0

words.sort_by!(&:length).reverse!

result = nil
until result
  word = words.shift

  word_char_count = word.chars.sort.chunk { |char| char }.to_h.transform_values(&:size)

  next unless word_char_count.all? { |char, size| size <= text_char_count[char] }

  first_char = word[0]
  last_char = word[-1]
  word_length = word.length

  first_char_indexes = text_chars.filter_map.with_index { |char, index| index if char == first_char }
  last_char_indexes = text_chars.filter_map.with_index { |char, index| index if char == last_char }

  first_char_indexes.each do |first_char_index|
    last_char_indexes.each do |last_char_index|
      next unless first_char_index < last_char_index

      step = (last_char_index - first_char_index).fdiv(word_length.pred)
      next unless step.to_r.denominator == 1

      indexes = first_char_index.step(by: step, to: last_char_index)
      next unless indexes.map { |index| text_chars[index] }.join == word

      secret_message_chars = text_chars.map.with_index { |char, index| indexes.include?(index) ? char.upcase : char }
      secret_message = secret_message_chars[indexes.first..indexes.last].join

      result = secret_message
    end
  end
end

# puts "answer"
puts result
