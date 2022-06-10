# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
fs = []
n.times do
  f = gets.to_i
  fs << f
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

results = fs.map do |f|
  f /= 5 while f % 5 == 0
  f /= 3 while f % 3 == 0
  f /= 2 while f.even?

  f == 1 ? 'VICTORY' : 'DEFEAT'
end

# puts "DEFEAT"
results.each do |result|
  puts result
end
