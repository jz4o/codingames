# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h = gets.to_i
results = []
h.times do
  row = gets.chomp

  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  result = row.split.map.with_index { |length, index| (index.even? ? '.' : 'O') * length.to_i }.join
  results << result

  # puts "answer"
end

puts results.map(&:size).uniq.one? ? results : 'INVALID'
