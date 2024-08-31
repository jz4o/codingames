# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

text = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

step1_replace_hash = {
  '??=' => '#',
  '??/' => '\\',
  "??'" => '^',
  '??(' => '[',
  '??)' => ']',
  '??!' => '|',
  '??-' => '~'
}
step1_text = text.gsub(Regexp.union(step1_replace_hash.keys), step1_replace_hash)

step2_text = step1_text.gsub(/(?<!\\)(\\x[\da-fA-F]{2}|\\U[\da-fA-F]{8}|\\u[\da-fA-F]{4})/) do
  replaced = $1[2..].to_i(16).chr
  replaced == '\\' ? '\\\\' : replaced
end
step2_text.gsub!(/(?<!\\)\\(.)/) { $1 }

step3_replace_hash = {
  '&lt;' => '<',
  '&gt;' => '>',
  '&bsol;' => '\\',
  '&amp;' => '&'
}
step3_text = step2_text.gsub(/&#(\d+);/) { $1.to_i.chr }
                       .gsub(Regexp.union(step3_replace_hash.keys), step3_replace_hash)

result = step3_text

# puts "answer"
puts result
