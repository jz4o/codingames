# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

total = gets.to_i
symbols = []
total.times do
  symbol = gets.chomp
  symbols << symbol
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

binary_cycle = (1...(2**total)).map { |i| i.to_s(2).rjust total, '0' }

results = []
results << symbols.first * total
symbols.each_cons(2) do |zero, one|
  replace_hash = { '0' => zero, '1' => one }
  results.concat(binary_cycle.map { |binary| binary.gsub(/./, replace_hash) })
end

# puts "combination(s)"
results.each do |result|
  puts result
end
