# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
input_rows = []
n.times do
  name, r, c = gets.split
  r = r.to_i
  c = c.to_i

  input_rows << [name, r, c]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Apple = Struct.new :name, :row, :column

apples = input_rows.map { |name, r, c| Apple.new name, r, c }

apple_rows = apples.map(&:row).uniq.sort
results = apples.sort_by do |apple|
  column_condition = apple_rows.index(apple.row).even? ? apple.column : -apple.column

  [apple.row, column_condition]
end.map(&:name)

result = results.join ','

# puts "UNKNOWN"
puts result
