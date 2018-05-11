# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

table = []
@n = gets.to_i
@n.times do
  table << gets.chomp
end

def t(tag, element)
  "<#{tag}>#{element}</#{tag}>"
end

puts '<table>'
data_rows = table.chunk { |row| row.chr.eql? '+' }.reject(&:first).map(&:last)
data_rows.each do |cell_rows|
  cells = cell_rows.map { |row| row[1..-2].split('|').map(&:strip) }
  puts t :tr, cells.transpose.map { |cell| t :td, cell.join(' ').strip }.join
end
puts '</table>'

