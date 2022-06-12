# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

typed_keys = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

before_chars = []
after_chars = []

typed_keys.chars.each do |char|
  case char
  when '<'
    after_chars.unshift before_chars.pop if before_chars.any?
  when '>'
    before_chars << after_chars.shift if after_chars.any?
  when '-'
    before_chars.pop
  else
    before_chars << char
  end
end

result = (before_chars + after_chars).join

# puts "computed text"
puts result
