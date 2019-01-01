# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
cards = []
@n.times do
  card = gets.chomp
  cards << card
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

results = []
cards.each do |card|
  sum_numbers = card.delete(' ').chars.map.with_index do |number, index|
    number = number.to_i

    if index.even?
      number *= 2
      number -= 9 if number >= 10
    end

    number
  end.sum

  results << (sum_numbers % 10 == 0 ? 'YES' : 'NO')
end

# puts "YES or NO"

puts results
