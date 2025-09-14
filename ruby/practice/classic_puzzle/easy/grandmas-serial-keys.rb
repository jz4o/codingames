# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

username = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

core_seed = (username.codepoints.sum * username.length) ^ 20_480

segment1 = core_seed & 65_535
segment2 = core_seed >> 16
segment3 = [username[0], username[-1]].sum(&:ord) * username.length
segment4 = [segment1, segment2, segment3].sum % 65_536

result = [segment1, segment2, segment3, segment4].map { |segment| segment.to_s(16).rjust(4, '0') }.join('-').upcase

# puts "Serial Key"
puts result
