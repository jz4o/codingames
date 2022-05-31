# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
lines = []
n.times do
  line = gets.chomp
  lines << line
end
n.times do
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  line = lines.shift
  indexes = line.chars.filter_map.with_index { |char, index| index if char == 'f' }

  drop_count = 0
  while index = indexes.shift
    drop_count += 1

    indexes.delete_if { |i| i <= index + 2 }
  end

  result = drop_count

  # puts "answer"
  puts result
end
