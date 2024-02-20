# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

num_of_lines_of_offering_statement = gets.to_i
offers = []
num_of_lines_of_offering_statement.times do
  offer = gets.chomp
  offers << offer
end
garden_height = gets.to_i
garden_rows = []
garden_height.times do
  garden_row = gets.chomp
  garden_rows << garden_row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

offer_hash = {}
offer_hash.default = 0
offers.each do |offer|
  amount_str, emojis = offer.split ' = '
  amount = amount_str[1..].to_i

  emojis.chars.each { |emoji| offer_hash[emoji.ord] = amount }
end

worth = garden_rows.join.chars.sum { |c| offer_hash[c.ord] }

result = "$#{worth.to_s.reverse.scan(/.{1,3}/).join(',').reverse}"

# puts "worth"
puts result
