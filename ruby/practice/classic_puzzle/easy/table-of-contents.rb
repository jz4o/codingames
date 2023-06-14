# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lengthofline = gets.to_i
n = gets.to_i
entries = []
n.times do
  entry = gets.chomp
  entries << entry
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

INDENT = ' ' * 4

section_numbers = []
results = entries.map do |entry|
  content, page = entry.split

  indent_level = content[/^>+/]&.size.to_i
  indent = INDENT * indent_level

  section_numbers[indent_level] = section_numbers[indent_level].to_i.next
  section_numbers[indent_level.next..] = nil
  section = "#{section_numbers[indent_level]} "

  title = content.sub(/^>+/, '')

  dot_count = lengthofline - indent.length - section.length - title.length - page.length
  dots = '.' * dot_count

  [indent, section, title, dots, page].join
end

# puts "Format error"
results.each do |result|
  puts result
end
