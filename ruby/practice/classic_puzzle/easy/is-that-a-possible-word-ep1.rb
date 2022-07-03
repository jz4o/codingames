# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_input = gets.chomp
states = gets.chomp
number_of_transitions = gets.to_i
transitions = []
number_of_transitions.times do
  transition = gets.chomp
  transitions << transition
end
start_state = gets.chomp
end_states = gets.chomp
number_of_words = gets.to_i
words = []
number_of_words.times do
  word = gets.chomp
  words << word
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

state_array = states.split
end_state_array = end_states.split

transition_hash = state_array.to_h { |state| [state, {}] }
transitions.each do |transition|
  from_state, char, to_state = transition.split
  transition_hash[from_state][char] = to_state
end

results = words.map do |word|
  end_state = word.chars.inject(start_state) { |state, char| transition_hash.dig(state, char) }

  end_state_array.include? end_state
end

# puts "true or false"
results.each do |result|
  puts result
end
