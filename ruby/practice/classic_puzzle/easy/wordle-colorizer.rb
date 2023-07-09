# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

answer = gets.chomp
n = gets.to_i
attempts = []
n.times do
  attempt = gets.chomp
  attempts << attempt
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

results = attempts.map do |attempt|
  answer_chars = answer.chars
  attempt_chars = attempt.chars

  right_indexes = attempt_chars.filter_map.with_index { |char, index| index if answer_chars[index] == char }
  answer_chars.delete_if.with_index { |_, index| right_indexes.include? index }

  result_chars = attempt_chars.map.with_index do |attempt_char, index|
    if right_indexes.include? index
      '#'
    elsif answer_chars.include? attempt_char
      answer_chars.delete_at answer_chars.index(attempt_char)
      'O'
    else
      'X'
    end
  end

  result_chars.join
end

# puts "OXOXO"
results.each do |result|
  puts result
end
