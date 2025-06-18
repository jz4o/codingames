# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

f = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Parentheses = Struct.new :begin_index, :end_index, :level

index_stack = []
parentheses_array = []
f.chars.each_with_index do |c, index|
  case c
  when '('
    index_stack << index
  when ')'
    level = index_stack.size
    begin_index = index_stack.pop
    parentheses_array << Parentheses.new(begin_index, index, level)
  end
end

max_level = parentheses_array.map(&:level).max.to_i
output_grid = []
output_grid << f.chars
output_grid.concat(Array.new(max_level + 2) { [' '] * f.size }) unless max_level.zero?

parentheses_array.each do |parentheses|
  begin_index = parentheses.begin_index
  end_index = parentheses.end_index
  level = parentheses.level

  nested_parentheses_array = parentheses_array.filter do |pa|
    (begin_index..end_index).cover? pa.begin_index
  end
  nest_level = nested_parentheses_array.map(&:level).max.to_i

  arrow_head_row = 1
  arrow_shaft_rows = 2..(nest_level - level + 2)
  level_row = nest_level - level + 3

  [begin_index, end_index].each do |index|
    output_grid[arrow_head_row][index] = '^'
    arrow_shaft_rows.each do |arrow_shaft_row|
      output_grid[arrow_shaft_row][index] = '|'
    end
    output_grid[level_row][index] = level
  end

  ((begin_index + 1)..(end_index - 1)).each do |i|
    output_grid[level_row][i] = '-'
  end
end

results = output_grid.map(&:join)

# puts "solution"
results.each do |result|
  puts result
end
