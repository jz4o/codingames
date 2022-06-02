# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
answers = []
n.times do
  answer = gets.chomp
  answers << answer
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Answer = Struct.new :age, :gender, :genre

answers.map! do |answer|
  age, gender, genre = answer.split
  age = age.to_i

  Answer.new age, gender, genre
end

train_answers = answers.filter(&:genre)
test_answers = answers - train_answers

learning_model = {}
train_answers.each do |answer|
  age = answer.age
  gender = answer.gender
  genre = answer.genre

  learning_model[gender] = learning_model[gender] || {}
  learning_model[gender][genre] = learning_model[gender][genre] || (age..age)

  age_range = learning_model[gender][genre]
  learning_model[gender][genre] = ([age_range.first, age].min..[age_range.last, age].max)
end

results = []
test_answers.each do |answer|
  age = answer.age
  gender = answer.gender

  predict, = learning_model[gender]&.find { |_, v| v.cover? age }
  results << (predict || 'None')
end

# puts "answer"
results.each do |result|
  puts result
end
