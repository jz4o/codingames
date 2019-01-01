STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# nb_floors:               number of floors
# width:                   width of the area
# nb_rounds:               maximum number of rounds
# exit_floor:              floor on which the exit is found
# exit_pos:                position of the exit on its floor
# nb_total_clones:         number of generated clones
# nb_additional_elevators: ignore (always zero)
# nb_elevators:            number of elevators
inputs = gets.split(' ').collect(&:to_i)
@nb_floors               = inputs[0]
@width                   = inputs[1]
@nb_rounds               = inputs[2]
@exit_floor              = inputs[3]
@exit_pos                = inputs[4]
@nb_total_clones         = inputs[5]
@nb_additional_elevators = inputs[6]
@nb_elevators            = inputs[7]

elevator_floors    = []
elevator_positions = []
@nb_elevators.times do
  # elevator_floor: floor on which this elevator is found
  # elevator_pos:   position of the elevator on its floor
  tmp = gets.split(' ').collect(&:to_i)
  elevator_floors    << tmp[0]
  elevator_positions << tmp[1]
end

# game loop
loop do
  # clone_floor: floor of the leading clone
  # clone_pos: position of the leading clone on its floor
  # direction: direction of the leading clone: LEFT or RIGHT
  clone_floor, clone_pos, direction = gets.split(' ')
  clone_floor = clone_floor.to_i
  clone_pos   = clone_pos.to_i

  elevator_index = elevator_floors.index(clone_floor)
  elevator_position = elevator_positions[elevator_index] if elevator_index
  target = elevator_position || @exit_pos

  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."

  is_already_facing_left_target  = target < clone_pos && direction.eql?('LEFT')
  is_already_facing_right_target = clone_pos < target && direction.eql?('RIGHT')
  if is_already_facing_left_target || is_already_facing_right_target || target == clone_pos
    puts 'WAIT'
  else
    puts 'BLOCK' # action: WAIT or BLOCK
  end
end
