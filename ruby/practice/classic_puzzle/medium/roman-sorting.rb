# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
xs = []
n.times do
  x = gets.to_i
  xs << x
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def arabia_to_roman(arabia)
  values = {
    1000 => 'M',
    500 => 'D',
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I'
  }

  subtractive_notation = {
    'DCCCC' => 'CM',
    'CCCC' => 'CD',
    'LXXXX' => 'XC',
    'XXXX' => 'XL',
    'VIIII' => 'IX',
    'IIII' => 'IV'
  }

  result = ''
  values.each do |value, roman|
    roman_count, arabia = arabia.divmod value

    result.concat roman * roman_count
  end

  subtractive_notation.each do |variant, subtractive|
    result.sub! variant, subtractive
  end

  result
end

result = xs.sort_by { |x| arabia_to_roman x }.join ' '

# puts "50 60 40"
puts result
