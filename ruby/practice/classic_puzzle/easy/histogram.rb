# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

ALPHABETS = ('A'..'Z').to_a

letters = s.upcase.delete "^#{ALPHABETS.join}"

DECIMALS_DIGITS = 2

alphabet_rows = ALPHABETS.map do |alphabet|
  count = letters.count alphabet
  percentage = count.to_f / letters.size * 100
  formatted_percentage = format "%#.0#{DECIMALS_DIGITS}f", percentage

  space = ' ' * percentage.round

  "#{alphabet} |#{space}|#{formatted_percentage}%".squeeze('|')
end

first_pipe_index = 2
bar_rows = Array.new(ALPHABETS.size + 1) do |index|
  above_last_pipe_index = alphabet_rows[[index - 1, 0].max]&.rindex('|') || first_pipe_index
  below_last_pipe_index = alphabet_rows[index]&.rindex('|') || first_pipe_index

  last_pipe_index = [above_last_pipe_index, below_last_pipe_index].max

  row = ' ' * (last_pipe_index + 1)

  row[first_pipe_index...last_pipe_index] = '-' * (last_pipe_index - first_pipe_index)

  row[first_pipe_index] = '+'
  row[above_last_pipe_index] = '+'
  row[below_last_pipe_index] = '+'

  row
end

results = bar_rows.zip(alphabet_rows).flatten.filter { |row| row }

# puts "answer"
results.each do |result|
  puts result
end
