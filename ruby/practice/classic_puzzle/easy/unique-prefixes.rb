# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
words = []
n.times do
  word = gets.chomp
  words << word
end
n.times do |i|
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  word = words[i]
  prefix_length = word.length.times.to_a.find do |length|
    words.one? { |w| w.start_with? word[..length] }
  end
  prefix_length ||= word.length

  result = word[..prefix_length]

  # puts "<word_prefix>"
  puts result
end
