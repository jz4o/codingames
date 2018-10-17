# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@number = gets.chomp

numbers = @number.split.map(&:to_i)

MAX_BASE = 36
(2..MAX_BASE).each do |base|
  next if base <= numbers.max

  base_number    = numbers.map { |number| number.to_s base }.join
  decimal_number = base_number.to_i(base).to_s
  result = (1..decimal_number.size).all? do |i|
    (decimal_number[0, i].to_i % i).zero?
  end

  puts base if result
end

