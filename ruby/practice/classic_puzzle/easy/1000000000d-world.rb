# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a = gets.chomp
b = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

a_vectors = a.split.map(&:to_i)
b_vectors = b.split.map(&:to_i)

result = 0
while a_vectors.any?
  a_length, a_value = a_vectors.shift 2
  b_length, b_value = b_vectors.shift 2

  length = [a_length, b_length].min
  value = a_value * b_value

  result += value * length

  a_vectors.unshift(a_length - length, a_value) if a_length > length
  b_vectors.unshift(b_length - length, b_value) if b_length > length
end

# puts "a DOT b"
puts result
