# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@encrypt = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "INVALID"

invalid_flag = false
binaries = ''
@encrypt.split(' ').each_slice(2) do |binary, count|
  invalid_flag = true and break unless %w[0 00].include?(binary) && count

  binaries += (binary == '0' ? '1' : '0') * count.size
end

if invalid_flag || (binaries.size % 7) != 0
  puts :INVALID
else
  puts binaries.scan(/.{7}/).map { |binary| binary.to_i(2).chr }.join
end
