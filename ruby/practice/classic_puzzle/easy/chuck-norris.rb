# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@message = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# convert decimal to 7 bit binary string
binary = ''
@message.chars.each do |s|
  binary << s.ord.to_s(2).rjust(7, '0')
end

# grouping same char and convert to array
matched_array = []
until binary.empty? do
  # get continuous same character from beginning of binary string
  matched = binary.match(/#{binary[0]}+/)[0]

  matched_array << matched

  binary.sub!(matched, '')
end

res = ''
matched_array.each do |m|
  res << '0' * (2 - m[0].to_i)
  res << ' '
  res << m.tr('1', '0')
  res << ' '
end

puts res.chop
