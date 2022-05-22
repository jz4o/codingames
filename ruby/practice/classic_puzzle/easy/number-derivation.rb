# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

require 'prime'

def derived_number(number)
  return 1 if number.prime?

  max_prime = number.prime_division.map(&:first).max
  mod = number / max_prime

  mod + (max_prime * derived_number(mod))
end

result = derived_number n

# puts "n_prime"
puts result
