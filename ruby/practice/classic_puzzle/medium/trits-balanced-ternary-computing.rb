# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@lhs = gets.chomp
@op = gets.chomp
@rhs = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "11T"

def balance_to_decimal(balance)
  balance.chars.reverse.map.with_index do |i, index|
    (i == 'T' ? -1 : i.to_i) * (3 ** index)
  end.sum
end

def decimal_to_balance(decimal)
  digits = []
  until decimal.zero?
    decimal, mod = decimal.divmod 3
    if mod == 2
      mod = 'T'
      decimal += 1
    end
    digits << mod
  end
  digits.empty? ? '0' : digits.reverse.join
end

@lhs = balance_to_decimal @lhs
@rhs = balance_to_decimal @rhs
@rhs = 3 ** @rhs if @op.sub!('<<', '*') || @op.sub!('>>', '/')
result_decimal = eval [@lhs, @op, @rhs].join

puts decimal_to_balance(result_decimal)

