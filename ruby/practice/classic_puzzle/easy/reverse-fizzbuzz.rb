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

first_number_index = lines.index { |line| line == line.to_i.to_s }
base_number = first_number_index.nil? ? 1 : lines[first_number_index].to_i - first_number_index

fizz_buzze_numbers = { fizz: [], buzz: [] }
lines.each.with_index(base_number) do |line, number|
  fizz_buzze_numbers[:fizz] << number if line.include? 'Fizz'
  fizz_buzze_numbers[:buzz] << number if line.include? 'Buzz'
end

fizz = fizz_buzze_numbers[:fizz].reduce(:gcd)
buzz = fizz_buzze_numbers[:buzz].reduce(:gcd)

# puts "fizz buzz"
puts "#{fizz} #{buzz}"
