# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
lines = []
n.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

code = lines.join

brackets =
  code.gsub(/(?<!\\)\\"/, '')
      .gsub(/"(.*?)"/, '')
      .delete('^(){}[]')

temp_brackets = brackets.dup
nil while temp_brackets.gsub!(/\(\)|{}|\[\]/, '')

result =
  if brackets.empty?
    'No brackets'
  elsif temp_brackets.empty?
    'Valid'
  else
    'Invalid'
  end

# puts "Valid, Invalid or No brackets"
puts result
