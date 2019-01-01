# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@text = gets.chomp
@format = gets.chomp

@format.gsub! '\\', '\\\\\\'
%w|^ * ( ) [ ] $|.each { |c| @format.gsub! c, "\\#{c}" }
@format.tr! '?', '.'
@format.gsub! '~', '.*'

puts @text.match?(Regexp.new(@format)) ? 'MATCH' : 'FAIL'
