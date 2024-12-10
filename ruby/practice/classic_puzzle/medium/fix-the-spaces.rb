# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

original = gets.chomp
words = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class ReorderingSentence
  def initialize(sentence, words)
    @remain_sentence = sentence
    @order_words = words
    @reordered_words = []
  end

  def candidate_next_words
    @order_words.filter { |word| @remain_sentence.start_with? word }.uniq
  end

  def decide_next_word(word)
    @remain_sentence.delete_prefix! word

    @order_words.delete_at(@order_words.index(word))
    @reordered_words << word
  end

  def reordered?
    @order_words.empty?
  end

  def reordered_sentence
    @reordered_words.join ' '
  end
end

reordering_sentences = [ReorderingSentence.new(original, words.split)]
reordered_sentences = []
while reordering_sentence = reordering_sentences.pop
  reordered_sentences << reordering_sentence.reordered_sentence and next if reordering_sentence.reordered?
  break if reordered_sentences.size > 1

  candidate_next_words = reordering_sentence.candidate_next_words
  next if candidate_next_words.empty?

  (candidate_next_words[1..] || []).each do |candidate_next_word|
    new_reordering_sentence = Marshal.load(Marshal.dump(reordering_sentence))
    new_reordering_sentence.decide_next_word candidate_next_word

    reordering_sentences << new_reordering_sentence
  end

  reordering_sentence.decide_next_word candidate_next_words.first
  reordering_sentences.unshift reordering_sentence
end

result = reordered_sentences.size == 1 ? reordered_sentences.first : 'Unsolvable'

# puts "original sentence with spaces"
puts result
