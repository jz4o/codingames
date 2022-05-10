# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

gymnasts = gets.chomp
categories = gets.chomp
n = gets.to_i
rows = []
n.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

gymnasts = gymnasts.split(',')
categories = categories.split(',').map(&:to_sym)

scores = {}
rows.each do |row|
  gymnast, bars, beam, floor = row.split(',')
  next unless gymnasts.include? gymnast

  bars, beam, floor = [bars, beam, floor].map(&:to_f)

  scores[gymnast] = { bars: 0, beam: 0, floor: 0 } unless scores.key? gymnast

  scores[gymnast][:bars] = [scores[gymnast][:bars], bars].max
  scores[gymnast][:beam] = [scores[gymnast][:beam], beam].max
  scores[gymnast][:floor] = [scores[gymnast][:floor], floor].max
end

results = gymnasts.map do |gymnast|
  score = scores[gymnast]
  categories.map { |category| score[category].to_s.sub(/\.?0+$/, '') }.join(',')
end

# puts "0.00"
results.each do |result|
  puts result
end
