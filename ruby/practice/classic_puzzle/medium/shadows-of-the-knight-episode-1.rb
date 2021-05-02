$stdout.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: width of the building.
# h: height of the building.
@w, @h = gets.split.collect(&:to_i)
@n = gets.to_i # maximum number of turns before game over.
@x0, @y0 = gets.split.collect(&:to_i)

bomb_min_height = @h
bomb_max_height = 0
bomb_min_width  = 0  # to Left
bomb_max_width  = @w # to Right

# (0,0) => (Horizontal, Vertical)
# (0,0) => UpperLeft of building

# game loop
loop do
  bomb_dir = gets.chomp # the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."
  if bomb_dir.include? 'U'
    bomb_min_height = @y0
    @y0 -= ((@y0 - bomb_max_height) / 2.0).ceil
  elsif bomb_dir.include? 'D'
    bomb_max_height = @y0
    @y0 += ((bomb_min_height - @y0) / 2.0).ceil
  end

  if bomb_dir.include? 'R'
    bomb_min_width = @x0
    @x0 += ((bomb_max_width - @x0) / 2.0).ceil
  elsif bomb_dir.include? 'L'
    bomb_max_width = @x0
    @x0 -= ((@x0 - bomb_min_width) / 2.0).ceil
  end

  # the location of the next window Batman should jump to.
  puts "#{@x0} #{@y0}"
end
