# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
xs = []
n.times do
  x = gets.chomp

  xs << x.to_i
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

HAPPY_NUMBER = 1
HAPPY_FACE   = ':)'.freeze
UNHAPPY_FACE = ':('.freeze

results = []
xs.each do |x|
  temp = x
  exit_numbers = [HAPPY_NUMBER]
  until exit_numbers.include? temp do
    exit_numbers << temp
    temp = temp.digits.map { |t| t**2 }.sum
  end
  result_face = temp == HAPPY_NUMBER ? HAPPY_FACE : UNHAPPY_FACE

  results << [x, result_face].join(' ')
end

# puts "23 :)"
puts results
