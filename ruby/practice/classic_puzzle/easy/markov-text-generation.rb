# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

t = gets.chomp
d = gets.to_i
l = gets.to_i
s = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

markov_chain = {}
markov_chain.default = []
t.split.each_cons(d.next) do |words|
  markov_value = words.pop
  markov_key = words.join(' ')

  markov_chain[markov_key] = markov_chain[markov_key] + [markov_value]
end

random_seed = 0
words = s.split
(l - words.size).times do
  random_seed += 7

  markov_key = words.last(d).join(' ')
  markov_values = markov_chain[markov_key]

  next_word = markov_values[random_seed % markov_values.size]

  words << next_word
end

result = words.join(' ')

# puts "fish is bad and"
puts result
