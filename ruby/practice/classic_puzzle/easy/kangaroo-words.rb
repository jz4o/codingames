# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
input_lines = []
n.times do
  lines = gets.chomp
  input_lines << lines
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

correspond_hash = {}
correspond_hash.default = []

input_lines.each do |line|
  words = line.split ', '
  words.each do |word|
    other_words = words - [word]
    regexp_word = Regexp.new word.chars.join '.*?'

    kangaroos = other_words.filter { |other_word| other_word =~ regexp_word }
    kangaroos.each do |kangaroo|
      correspond_hash[kangaroo] += [word]
    end
  end
end

results =
  if correspond_hash.empty?
    ['NONE']
  else
    correspond_hash.sort.map do |key, values|
      "#{key}: #{values.join ', '}"
    end
  end

# puts "answer"
results.each do |result|
  puts result
end
