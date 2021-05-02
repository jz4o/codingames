# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_w, h = gets.split.collect(&:to_i)
n = gets.to_i
map = []
h.times do
  line = gets.chomp

  map << line.chars
end

class Robot
  def initialize
    @directions = %w[N E S W]
    @logs = []
  end

  def set_place(x, y)
    @initial_x = @x = x
    @initial_y = @y = y
  end

  def place
    "#{@x} #{@y}"
  end

  def place_with_direction
    "#{place} #{direction}"
  end

  def direction
    @directions.first
  end

  def forward
    case direction
    when 'N'
      @y -= 1
    when 'E'
      @x += 1
    when 'S'
      @y += 1
    when 'W'
      @x -= 1
    end
  end

  def ahead_mass_index
    case direction
    when 'N'
      [@y - 1, @x]
    when 'E'
      [@y, @x + 1]
    when 'S'
      [@y + 1, @x]
    when 'W'
      [@y, @x - 1]
    end
  end

  def turn_right
    @directions.rotate!
  end

  def log
    @logs << place_with_direction
  end

  def logged_place?
    @logs.include? place_with_direction
  end

  def skiped_turn(n, turn)
    loop_begin_turn = @logs.index place_with_direction
    loop_size = turn - loop_begin_turn

    n - ((n - loop_begin_turn) % loop_size)
  end
end

robot = Robot.new
map.each_with_index do |line, line_index|
  next unless line.include? 'O'

  y = line_index
  x = line.index 'O'
  robot.set_place x, y
  break
end

turn = 0
while turn < n do
  robot.log

  turn += 1

  robot.forward
  robot.turn_right while map.dig(*robot.ahead_mass_index) == '#'

  # omit to loop turn
  turn = robot.skiped_turn(n, turn) if robot.logged_place?
end

puts robot.place
