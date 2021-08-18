# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

p = gets.to_i
c = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def decode(encoded_value, alphabet)
  result = ''
  int = encoded_value + 1
  while int > 0
    int, mod = int.divmod alphabet.size
    int -= 1 if mod == 0

    result += alphabet[mod - 1]
  end

  result
end

# puts "Good Luck :->"
puts decode(p, c)
