# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = gets.to_i
_h = gets.to_i
t = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

words = t.split.each_slice(2).map do |black, white|
  '*' * black.to_i + ' ' * white.to_i
end

results = words.join.scan(/.{#{w}}/).map { |row| "|#{row}|" }

# puts "|********|"
# puts "|**      |"
# puts "|    ****|"
results.each do |result|
  puts result
end
