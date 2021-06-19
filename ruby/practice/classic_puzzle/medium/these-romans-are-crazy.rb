# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rom1 = gets.chomp
rom2 = gets.chomp

def roman_to_arabia(roman)
  values = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  subtractive_notation = {
    'CM' => 'DCCCC',
    'CD' => 'CCCC',
    'XC' => 'LXXXX',
    'XL' => 'XXXX',
    'IX' => 'VIIII',
    'IV' => 'IIII'
  }

  subtractive_notation.each do |subtractive, variant|
    roman.sub! subtractive, variant
  end

  roman.chars.sum { |c| values[c] }
end

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

arabia1 = roman_to_arabia rom1
arabia2 = roman_to_arabia rom2
puts arabia_to_roman(arabia1 + arabia2)
