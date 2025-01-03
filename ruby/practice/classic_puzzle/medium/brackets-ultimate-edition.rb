# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
expressions = []
n.times do
  expression = gets.chomp
  expressions << expression
end
# n.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "-1"
# end

left_elements = '([{<'
right_elements = ')]}>'

brackets_regexp = /[()]{2}|[\[\]]{2}|[{}]{2}|[<>]{2}/
valid_brackets_regexp = /\(\)|\[\]|\{\}|<>/

results = expressions.map do |expression|
  temp_expression = expression.delete('^()[]{}<>')

  replace_count = 0
  while temp_expression.match? brackets_regexp
    nil while temp_expression.gsub!(valid_brackets_regexp, '')

    center_index = temp_expression.length / 2
    match_brackets = temp_expression.match brackets_regexp, center_index - 1
    match_brackets ||= temp_expression.match brackets_regexp
    break unless match_brackets

    temp_expression[match_brackets.begin(0), 2] = ''

    left, right = match_brackets.to_s.chars
    replace_count += 1 if right_elements.include? left
    replace_count += 1 if left_elements.include? right
  end

  temp_expression.empty? ? replace_count : -1
end

results.each do |result|
  puts result
end
