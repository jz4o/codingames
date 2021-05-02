$stdout.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: number of columns.
# h: number of rows.
@w, @h = gets.split.collect(&:to_i)
lines = []
@h.times do
  # represents a line in the grid and contains W integers. Each integer represents one room of a given type.
  lines << gets.chomp
end
lines.map!(&:split)
@ex = gets.to_i # the coordinate along the X axis of the exit (not useful for this first mission, but must be read).

# direction
TOP    = 0
LEFT   = 1
RIGHT  = 2
BOTTOM = 3
NONE   = nil

# Key   : direction of entrance
# Value : direction of exit(index: type of panel)
PANEL_DESTINATION = {
  TOP: [NONE, BOTTOM, NONE, BOTTOM, LEFT, RIGHT, NONE, BOTTOM, NONE, BOTTOM, LEFT, RIGHT, NONE, NONE],
  LEFT: [NONE, BOTTOM, RIGHT, NONE, NONE, BOTTOM, RIGHT, NONE, BOTTOM, BOTTOM, NONE, NONE, NONE, BOTTOM],
  RIGHT: [NONE, BOTTOM, LEFT, NONE, BOTTOM, NONE, LEFT, BOTTOM, BOTTOM, NONE, NONE, NONE, BOTTOM, NONE]
}.freeze

# game loop
loop do
  xi, yi, pos = gets.split
  xi = xi.to_i
  yi = yi.to_i

  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."
  panel_type = lines[yi][xi].to_i
  next_dest = PANEL_DESTINATION[pos.to_sym][panel_type]

  case next_dest
  when LEFT
    xi -= 1
  when RIGHT
    xi += 1
  when BOTTOM
    yi += 1
  end

  # One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.
  puts "#{xi} #{yi}"
end
