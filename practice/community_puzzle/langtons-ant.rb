uto-generated code below aims at helping you parse
# the standard input according to the problem statement.

MARKS = { black: '#', white: '.' }
directions = %w[N E S W]

@w, @h = gets.split(" ").collect {|x| x.to_i}
@x, @y = gets.split(" ").collect {|x| x.to_i}
@direction = gets.chomp
directions.rotate! (directions.index @direction)
@t = gets.to_i
map = []
@h.times do
  map << gets.chomp.chars
end
@t.times do

  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."

  # puts "answer"

  color_is_black = map[@y][@x] == MARKS[:black]
  color_is_black ? directions.rotate! : directions.rotate!(-1)
  map[@y][@x] = color_is_black ? MARKS[:white] : MARKS[:black]

  case directions.first
  when 'N'
    @y -= 1
  when 'E'
    @x += 1
  when 'W'
    @x -= 1
  when 'S'
    @y += 1
  end
end
puts map.map(&:join)
