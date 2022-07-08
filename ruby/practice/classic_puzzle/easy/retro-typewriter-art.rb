# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

t = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

ABBREVIATIONS = {
  'sp' => ' ',
  'bS' => '\\',
  'sQ' => "'",
  'nl' => "\n"
}.freeze

t.gsub!('nl', '1nl')

chars = t.split.map do |chunk|
  count, char = chunk.scan(/^(\d+)(.+?)$/).flatten

  (ABBREVIATIONS[char] || char) * count.to_i
end

result = chars.join

# puts "answer"
puts result
