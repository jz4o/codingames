# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

input = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def expansion(str)
  str_elements = str.split(/(I|U|-(?!\d))/)
  str_elements[1..]
    .each_slice(2)
    .reduce(to_array(str_elements[0])) do |result, (operation, array_str)|
      array = to_array array_str
      case operation
      when 'U'
        result | array
      when 'I'
        result & array
      when '-'
        result - array
      end
    end
end

def to_array(str)
  case str
  when /\{.*\}/
    str[1...-1].split(';').map(&:to_i)
  when /[\[|\]].*[\[|\]]/
    begin_bracket = str[0]
    end_bracket = str[-1]
    begin_num, end_num = str[1...-1].split(';').map(&:to_i)

    begin_num += 1 if begin_bracket == ']'
    end_num -= 1 if end_bracket == '['

    (begin_num..end_num).to_a
  else
    []
  end
end

def to_braces(nums)
  "{#{nums.join ';'}}"
end

temp_input = input.clone
while temp_input.match?(/\(.*?\)/)
  parenthese = temp_input.match(/\([^(]*?\)/).to_s
  expansioned_parenthese = to_braces(expansion(parenthese[1...-1]))
  temp_input.gsub! parenthese, expansioned_parenthese
end
result_array = expansion temp_input

result = result_array.any? ? result_array.sort.join(' ') : 'EMPTY'

# puts "answer"
puts result
