# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = gets.to_i
lines = []
m.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

lines.map! { |line| line.split.map(&:to_i) }

tc_n60 = lines.sum { |line| 10 + (line.sum - 40).fdiv(7) }.fdiv(lines.size).round(1)

if (5..30).cover? tc_n60
  chirps = lines.flatten
  chirps.pop if chirps.size.odd?
  tc_n8 = chirps.each_slice(2).sum { |l, r| l + r + 5 }.fdiv(chirps.size / 2).round(1)
end

results = [tc_n60, tc_n8].compact

# puts "answer"
results.each do |result|
  puts result
end
