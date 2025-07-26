# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ss = []
5.times do
  s = gets.chomp
  ss << s
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

CHINESE_NUMBERS = %w[
  *000*0***00***00***0*000*
  **********00000**********
  00000***************00000
  00000******000******00000
  000000*0*000*000***000000
  00000**0***0000**0*000000
  **0****0**00000*0*0*0***0
  **0****0**00000**0****000
  *0*0**0*0**0*0**0*0*0***0
  **0****0**0000**0*0*0**00
].freeze

chinese_numbers = ss.map(&:split).transpose.map(&:join)
numbers = chinese_numbers.map { |chinese_number| CHINESE_NUMBERS.index chinese_number }

result = numbers.join

# puts "The number"
puts result
