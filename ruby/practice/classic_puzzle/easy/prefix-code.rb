# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

PrefixCode = Struct.new(:binary, :char)

n = gets.to_i
prefix_codes = []
n.times do
  b, c = gets.split
  c = c.to_i

  prefix_codes << PrefixCode.new(b, c.chr)
end
s = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

prefix_codes.sort_by! { |pre| pre.binary.length }.reverse!

temp_s = s.dup

result = ''
until temp_s.empty? do
  prefix_code = prefix_codes.find { |code| temp_s.start_with? code.binary }

  unless prefix_code
    result = "DECODE FAIL AT INDEX #{s.length - temp_s.length}"
    break
  end

  temp_s.delete_prefix! prefix_code.binary
  result += prefix_code.char
end

# puts "abracadabra"
puts result
