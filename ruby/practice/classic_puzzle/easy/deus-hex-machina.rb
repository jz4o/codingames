# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

number = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

converter = {
  from: '123456789abcdef0',
  to_v: '153#2e#8a9#c#6#0',
  to_h: '15##2a#8e6d#b9#0',
  to_vh: '12##59#86e###a#0'
}

binary = number.to_i(16).to_s(2)
is_v_reverse = binary.count('1').odd?
is_h_reverse = binary.count('0').odd?
convert_to =
  if is_v_reverse && is_h_reverse
    :to_vh
  elsif is_v_reverse
    :to_v
  elsif is_h_reverse
    :to_h
  else
    :from
  end

result = number.tr converter[:from], converter[convert_to]
result.reverse! if is_h_reverse
result = 'Not a number' if result.include? '#'
result = result[...1000]

# puts "hexflipped_number"
puts result
