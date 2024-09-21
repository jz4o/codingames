# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
k = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

digits = n.digits
result = digits.size.times.sum do |index|
  digit = digits[index]
  count = 0

  count += index.times.sum do |i|
    w = 10**i
    c = 10**(index - i - 1)
    w * c * digit
  end

  count += if digit == k
             digits[...index].reverse.join.to_i.next
           elsif digit > k
             10**index
           else
             0
           end

  count
end

# puts "answer"
puts result
