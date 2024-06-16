# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# nb_floors: number of floors
# width: width of the area
# nb_rounds: maximum number of rounds
# exit_floor: floor on which the exit is found
# exit_pos: position of the exit on its floor
# nb_total_clones: number of generated clones
# nb_additional_elevators: ignore (always zero)
# nb_elevators: number of elevators
inputs = [int(i) for i in input().split()]
nb_floors, width, nb_rounds, exit_floor, exit_pos, nb_total_clones, nb_additional_elevators, nb_elevators = inputs
elevator_floors = []
elevator_positions = []
for _ in range(nb_elevators):
    # elevator_floor: floor on which this elevator is found
    # elevator_pos: position of the elevator on its floor
    elevator_floor, elevator_pos = (int(j) for j in input().split())

    elevator_floors.append(elevator_floor)
    elevator_positions.append(elevator_pos)

# game loop
while True:
    inputs = input().split()
    clone_floor = int(inputs[0])  # floor of the leading clone
    clone_pos = int(inputs[1])  # position of the leading clone on its floor
    direction = inputs[2]  # direction of the leading clone: LEFT or RIGHT

    # Write an action using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    elevator_index = elevator_floors.index(clone_floor) if clone_floor in elevator_floors else None
    target = elevator_positions[elevator_index] if elevator_index is not None else exit_pos

    is_already_facing_left_target = target < clone_pos and direction == 'LEFT'
    is_already_facing_right_target = clone_pos < target and direction == 'RIGHT'
    if is_already_facing_left_target or is_already_facing_right_target or target == clone_pos:
        result = 'WAIT'
    else:
        result = 'BLOCK'

    # action: WAIT or BLOCK
    # print("WAIT")
    print(result)
