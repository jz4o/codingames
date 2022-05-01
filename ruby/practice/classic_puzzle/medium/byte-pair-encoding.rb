# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, _m = gets.split.collect(&:to_i)
lines = []
n.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

string = lines.join

replaced_string = string.dup
replace_array = []

replace_char = 'Z'

loop do
  char_groups = replaced_string.chars.each_cons(2).map(&:join).uniq
  group_sizes = char_groups.map { |char_group| [char_group, replaced_string.scan(char_group).size] }

  max_group_size = group_sizes.map(&:last).max
  target_char, target_size = group_sizes.find { |group_size| group_size.last == max_group_size }

  break if target_size < 2

  replaced_string.gsub! target_char, replace_char
  replace_array << "#{replace_char} = #{target_char}"

  replace_char = replace_char.ord.pred.chr
end

results = [replaced_string] + replace_array

# puts "answer"
results.each do |result|
  puts result
end
