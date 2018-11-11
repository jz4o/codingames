# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@l, @c = gets.split(" ").collect {|x| x.to_i}
map = []
@l.times do
  map << gets.chomp.split('')
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

class Bender
  LOOP_BORDER = 10
  DIRECTIONS = {
    'S' => 'SOUTH',
    'E' => 'EAST',
    'N' => 'NORTH',
    'W' => 'WEST'
  }

  @@direction_priorities = DIRECTIONS.values

  def initialize(map)
    @map    = map
    @direction  = @@direction_priorities.first
    @break_mode = false
    @position   = nil
    @reached_position_count = {}
    @teleporters  = []
    @history = []

    map.each_with_index do |line_chars, line_index|
      line_chars.each_with_index do |char, char_index|
        @position = Position.new char_index, line_index if char.eql?('@')
        @teleporters << Position.new(char_index, line_index) if char.eql?('T')
      end
    end
  end

  def kind_of_position(position = @position)
    @map[position.y][position.x]
  end

  def ahead_position(direction = @direction)
    case direction
    when DIRECTIONS['S']
      Position.new @position.x, @position.y + 1
    when DIRECTIONS['E']
      Position.new @position.x + 1, @position.y
    when DIRECTIONS['N']
      Position.new @position.x, @position.y - 1
    when DIRECTIONS['W']
      Position.new @position.x - 1, @position.y
    end
  end

  def ahead_is_obstacle?
    ['#', 'X'].include? kind_of_position(ahead_position)
  end

  def forward
    @position = ahead_position
  end

  def can_breaking_forward?
    @break_mode && kind_of_position(ahead_position).eql?('X')
  end

  def break_to_ahead
    ahead = ahead_position
    @map[ahead.y][ahead.x] = ' '
  end

  def change_direction(direction = nil)
    return @direction = direction if direction

    @@direction_priorities.each do |direction|
      unless ['#', 'X'].include? kind_of_position ahead_position(direction)
        return @direction = direction
      end
    end
  end

  def change_break_mode
    @break_mode = !@break_mode
  end

  def reverse_direction_priorities
    @@direction_priorities.reverse!
  end

  def teleport
    @position = (@teleporters - [@position]).first
  end

  def log
    @history << { position: @position, direction: @direction }
    if @reached_position_count[@position.to_s]
      @reached_position_count[@position.to_s] += 1
    else
      @reached_position_count[@position.to_s] = 0
    end
  end

  def max_reached_count
    @reached_position_count.values.max || 0
  end

  def standup_at_goal?
    kind_of_position.eql? '$'
  end

  def direction_historys
    @history.map { |log| log[:direction] }
  end


  class Position
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def to_s
      "x:#{@x} , y:#{@y}"
    end

    def eql?(another)
      @x.eql?(another.x) && @y.eql?(another.y)
    end

    def hash
      @x.hash * @y.hash
    end
  end
end

bender = Bender.new map
loop_flag = false
until bender.standup_at_goal? do
  moved = false
  if bender.can_breaking_forward?
    bender.break_to_ahead
    bender.forward
    moved = true
  elsif bender.ahead_is_obstacle?
    bender.change_direction
  else
    bender.forward
    moved = true
  end

  if moved
    bender.log

    case kind_of_position = bender.kind_of_position
    when *Bender::DIRECTIONS.keys
      bender.change_direction Bender::DIRECTIONS[kind_of_position]
    when 'B'
      bender.change_break_mode
    when 'I'
      bender.reverse_direction_priorities
    when 'T'
      bender.teleport
    end
  end

  if bender.max_reached_count > Bender::LOOP_BORDER
    loop_flag = true
    break
  end
end

puts loop_flag ? 'LOOP' : bender.direction_historys

