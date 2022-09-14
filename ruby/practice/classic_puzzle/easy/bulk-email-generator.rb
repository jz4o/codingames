# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
lines = []
n.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

joined_lines = lines.join("\n")

choice_count = 0
joined_lines.scan(/\(.*?\)/m).each do |choice_text|
  choices = choice_text.delete('()').split('|', -1)
  choiced = choices[choice_count % choices.size]

  choice_count += 1

  joined_lines.sub! choice_text, choiced
end

results = joined_lines.split("\n")

# puts "42"
results.each do |result|
  puts result
end
