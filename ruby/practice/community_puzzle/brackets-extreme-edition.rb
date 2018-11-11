# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@expression = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "true/false"

BRACKETS = {
  '(' => ')',
  '[' => ']',
  '{' => '}'
}.freeze

@expression.delete!("^#{BRACKETS.to_a.join}")

collect_flag = true
chars = []

@expression.split('').each do |char|
  next chars << char if BRACKETS[char]
  next if BRACKETS[chars.pop] == char
  break collect_flag = false
end
collect_flag = false unless chars.empty?

puts collect_flag

