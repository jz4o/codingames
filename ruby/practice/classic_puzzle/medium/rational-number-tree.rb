# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
lines = []
n.times do
  line = gets.chomp

  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def rational_to_directions(rational)
  min = Rational(0, 1)
  target = Rational(1, 1)
  max = Struct.new(:numerator, :denominator).new(1, 0)

  result = ''
  until rational == target
    if rational < target
      max = target
      result.concat 'L'
    else
      min = target
      result.concat 'R'
    end

    target = Rational(min.numerator + max.numerator, min.denominator + max.denominator)
  end

  result
end

def directions_to_rational(directions)
  min = Rational(0, 1)
  target = Rational(1, 1)
  max = Struct.new(:numerator, :denominator).new(1, 0)

  directions.chars.each do |direction|
    if direction == 'L'
      max = target
    else
      min = target
    end

    target = Rational(min.numerator + max.numerator, min.denominator + max.denominator)
  end

  target
end

results = lines.map do |line|
  if line.match? %r{\d+/\d+}
    rational_to_directions Rational(line)
  else
    directions_to_rational line
  end
end

# puts "answer"
results.each do |result|
  puts result
end
