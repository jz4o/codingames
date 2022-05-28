# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
ss = []
n.times do
  s = gets.chomp
  ss << s
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

border_prev, border_next = ss.sort[n / 2 - 1, 2]

border = ''
chars = border_prev.chars

while char = chars.shift do
  border_char = "#{border}#{char}"
  border_char_next = border_char.next

  if border_prev <= border_char && border_char < border_next
    border += char
    break
  elsif border_prev <= border_char_next && border_char_next < border_next
    border += char.next
    break
  else
    border += char
  end
end

result = border

# puts "answer"
puts result
