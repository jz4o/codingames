# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@intext = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "solution"

require_period = @intext[-1] == '.'

@intext.gsub!(',', ', ')
@intext.squeeze!(' ')

@intext = @intext.split('.')
@intext = @intext.map{ |line| line.strip.capitalize! }.compact.join('. ')

@intext.gsub!(' ,', ',')
@intext.squeeze!(',')

@intext += '.' if require_period

puts @intext

