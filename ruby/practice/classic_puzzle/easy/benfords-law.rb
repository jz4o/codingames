# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
transactions = []
n.times do
  transaction = gets.chomp

  transactions << transaction
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

benford_law_percentages = [0, 0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046]
first_numbers = transactions.map! { |transaction| transaction[/([1-9])/, 1].to_i }

is_fraudulent = (1..9).any? do |i|
  benford_law_percentage = benford_law_percentages[i]
  percent = first_numbers.count(i) / n.to_f

  !((benford_law_percentage - 0.1)..(benford_law_percentage + 0.1)).cover?(percent)
end

# puts "false"
puts is_fraudulent
