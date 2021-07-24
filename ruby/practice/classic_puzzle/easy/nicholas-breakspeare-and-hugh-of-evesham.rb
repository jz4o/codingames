# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
numbers = []
n.times do
  x = gets.chomp

  numbers << x
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def how_to_read(number)
  return "negative #{how_to_read number[1..]}" if number[0] == '-'

  if number.size >= 4
    over_thousand_unit_names = ['', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion']

    number_size = number.size
    unit_number_size = number_size % 3
    unit_number_size = 3 if unit_number_size.zero?
    mod_number_size = number_size - unit_number_size

    unit_number = number[0, unit_number_size]
    mod_number = number[unit_number_size..]

    result = ''
    result += "#{how_to_read unit_number} #{over_thousand_unit_names[mod_number_size / 3]}"
    result += " #{how_to_read mod_number}" unless mod_number.match?(/^0+$/)

    return result
  end

  result = ''
  number = number.to_i
  case number
  when 100..nil
    hundred_unit, mod_unit = number.divmod(100)

    result += "#{how_to_read hundred_unit.to_s} hundred" unless hundred_unit.zero?
    result += " #{how_to_read mod_unit.to_s}" unless mod_unit.zero?
  when 20...100
    ten_unit_names = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
    ten_unit, mod_unit = number.divmod(10)

    result += ten_unit_names[ten_unit] unless ten_unit.zero?
    result += "-#{how_to_read mod_unit.to_s}" unless mod_unit.zero?
  else
    under_twenty_names = %w[
      zero one two three four five six seven eight nine ten
      eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen
    ]

    result = under_twenty_names[number]
  end

  result.strip
end

results = numbers.map { |number| how_to_read number }

# puts "cardinal"
results.each do |result|
  puts result
end
