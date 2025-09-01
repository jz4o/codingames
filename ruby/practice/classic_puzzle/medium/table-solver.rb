# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

input_lines = gets.to_i
ss = []
input_lines.times do
  s = gets.chomp
  ss << s
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

line_length = ss.first.length
cell_length = ss.first.split('|').first.length

separate_row = '_' * line_length

grid = ss.filter { |s| !s.match?(/^_+$/) }.map { |s| s.split('|').map(&:strip) }

operation_str = grid.first.first
operation = operation_str == 'x' ? :* : operation_str.to_sym
reverse_operation = {
  :+ => :-,
  :- => :+,
  :* => :/
}[operation]

top_numbers = grid.first[1..].map { |c| c.empty? ? nil : c.to_i }
left_numbers = grid[1..].map { |row| row.first.empty? ? nil : row.first.to_i }
numbers_grid = grid[1..].map { |row| row[1..].map { |c| c.empty? ? nil : c.to_i } }

while [*top_numbers, *left_numbers, *numbers_grid.flatten].include? nil
  numbers_grid.each_with_index do |row, row_index|
    row.each_with_index do |value, value_index|
      top_number = top_numbers[value_index]
      left_number = left_numbers[row_index]
      next unless [top_number, left_number, value].count(nil) == 1

      if top_number.nil?
        top_numbers[value_index] = value.method(reverse_operation).call(left_number)
      elsif left_number.nil?
        left_numbers[row_index] =
          if operation == :-
            top_number.method(operation).call(value)
          else
            value.method(reverse_operation).call(top_number)
          end
      elsif value.nil?
        numbers_grid[row_index][value_index] = top_number.method(operation).call(left_number)
      end
    end
  end
end

result_grid = [
  [operation_str, *top_numbers],
  *left_numbers.zip(numbers_grid).map { |left_number, number_row| [left_number, *number_row] }
]

results = []
result_grid.each do |result_row|
  results << result_row.map { |value| value.to_s.ljust(cell_length) }.join('|')
  results << separate_row
end
results.pop

# puts "The finished table"
results.each do |result|
  puts result
end
