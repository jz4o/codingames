# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

type = gets.chomp
nb_lines_v1 = gets.to_i
line_v1s = []
nb_lines_v1.times do
  line_v1 = gets.chomp
  line_v1s << line_v1
end
nb_lines_v2 = gets.to_i
line_v2s = []
nb_lines_v2.times do
  line_v2 = gets.chomp
  line_v2s << line_v2
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def get_diff_by_number(before_lines, after_lines)
  add_or_delete_lines =
    if before_lines.size < after_lines.size
      after_lines[before_lines.size..].map { |line| "ADD: #{line}" }
    elsif after_lines.size < before_lines.size
      before_lines[after_lines.size..].map { |line| "DELETE: #{line}" }
    else
      []
    end

  check_size = [before_lines.size, after_lines.size].min
  change_lines = before_lines[...check_size].filter_map.with_index do |line, index|
    after_line = after_lines[index]
    next if line == after_line

    "CHANGE: #{line} ---> #{after_line}"
  end

  results = []
  results.concat add_or_delete_lines
  results.concat change_lines

  results.any? ? results.sort : ['No Diffs']
end

def get_diff_by_content(before_lines, after_lines)
  add_lines = after_lines - before_lines
  delete_lines = before_lines - after_lines

  move_lines = before_lines.filter_map.with_index do |line, index|
    next if add_lines.include?(line) || delete_lines.include?(line)
    next if line == after_lines[index]

    from_index = index + 1
    to_index = after_lines.index(line) + 1
    "MOVE: #{line} @:#{from_index} >>> @:#{to_index}"
  end

  results = []
  results.concat(add_lines.map { |line| "ADD: #{line}" })
  results.concat(delete_lines.map { |line| "DELETE: #{line}" })
  results.concat move_lines

  results.any? ? results.sort : ['No Diffs']
end

method_name = type == 'BY_NUMBER' ? :get_diff_by_number : :get_diff_by_content
results = method(method_name).call(line_v1s, line_v2s)

# puts "diffs"
results.each do |result|
  puts result
end
