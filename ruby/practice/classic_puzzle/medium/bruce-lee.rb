# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@encrypt = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "INVALID"

KIND_OF_FIRST_SEQUENCE = %w[0 00].freeze

invalid_flag = false
binaries = ''
@encrypt.split.each_slice(2) do |binary, count|
  invalid_flag = true and break unless KIND_OF_FIRST_SEQUENCE.include?(binary) && count

  binaries += (binary == '0' ? '1' : '0') * count.size
end

if invalid_flag || (binaries.size % 7) != 0
  puts :INVALID
else
  puts binaries.scan(/.{7}/).map { |binary| binary.to_i(2).chr }.join
end
