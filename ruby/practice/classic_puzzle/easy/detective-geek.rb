# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

time = gets.chomp
address = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

MONTHS = %w[jan feb mar apr may jun jul aug sep oct nov dec].freeze

results = []
results << time.tr('*#', '01').to_i(2).to_s.rjust(4, '0').insert(2, ':')
results << address.split.map do |word|
  word.scan(/.{3}/).map { |month| MONTHS.index(month).to_s(MONTHS.size) }.join.to_i(MONTHS.size).chr
end.join

# puts "answer"
results.each do |result|
  puts result
end
