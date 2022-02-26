# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

expression = gets.chomp
types = gets.chomp
n = gets.to_i
rows = []
n.times do
  row = gets.chomp

  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

expressions = expression.scan(/[-+][a-z]+/)
int_expressions = expressions.zip(types.split(',')).filter_map { |express, type| express[1..] if type == 'int' }

objects = rows.map do |row|
  object = row.split(',').map do |column|
    k, v = column.split(':')
    v = v.to_i if int_expressions.include? k

    [k, v]
  end

  object.to_h
end

sort_condition = expressions.map { |express| [express[1..], express[0] == '-'] }
sort_condition << ['id', false]

objects.sort! do |a, b|
  sort_conditions = sort_condition.map do |column, is_reverse|
    is_reverse ? b[column] <=> a[column] : a[column] <=> b[column]
  end

  sort_conditions.filter_map(&:nonzero?).first
end

results = objects.map { |object| object['id'] }

# puts "answer"
results.each do |result|
  puts result
end
