# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@phrase = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

def get_alphabets_every_by(n)
  ('A'..'Z').select.with_index(1) do |alpha, index|
    index % n == 0
  end
end

class String
  def get_indexes(search_array)
    result = self.chars.map.with_index do |char, index|
      index if search_array.include? char
    end
    result.compact
  end

  def part_shift(indexes)
    indexes.each_cons(2) do |left, right|
      self[left], self[right] = self[right], self[left]
    end
  end

  def part_unshift(indexes)
    part_shift(indexes.reverse)
  end

  def part_reverse(indexes)
    (indexes.size / 2).times do
      left, right = indexes.shift, indexes.pop
      self[left], self[right] = self[right], self[left]
    end
  end
end

# reverse word length
size_of_words = @phrase.split.map { |word| word.size }
phrase_chars = @phrase.gsub(/\s/, '').chars
words = size_of_words.reverse.map do |size_of_word|
  phrase_chars.shift(size_of_word).join
end
@phrase = words.join(' ')

# unshift every 4th alphabets
@phrase.part_unshift @phrase.get_indexes(get_alphabets_every_by 4)

# shift every 3rd alphabets
@phrase.part_shift @phrase.get_indexes(get_alphabets_every_by 3)

# reverse every 2nd alphabets
@phrase.part_reverse @phrase.get_indexes(get_alphabets_every_by 2)

puts @phrase

