# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# nbFloors: number of floors
# width: width of the area
# nbRounds: maximum number of rounds
# exitFloor: floor on which the exit is found
# exitPos: position of the exit on its floor
# nbTotalClones: number of generated clones
# nbAdditionalElevators: ignore (always zero)
# nbElevators: number of elevators
read -r nbFloors width nbRounds exitFloor exitPos nbTotalClones nbAdditionalElevators nbElevators

declare -A elevator_positions=()
for (( i=0; i<$nbElevators; i++ )); do
    # elevatorFloor: floor on which this elevator is found
    # elevatorPos: position of the elevator on its floor
    read -r elevatorFloor elevatorPos
    elevator_positions[$elevatorFloor]=$elevatorPos
done

# game loop
while true; do
    # cloneFloor: floor of the leading clone
    # clonePos: position of the leading clone on its floor
    # direction: direction of the leading clone: LEFT or RIGHT
    read -r cloneFloor clonePos direction

    # Write an action using echo
    # To debug: echo "Debug messages..." >&2

    elevator_position="${elevator_positions[$cloneFloor]}"
    target="$elevator_position"
    if [ "$target" = "" ]; then
        target=$exitPos
    fi

    is_already_facing_left_target=0
    if [ $target -lt $clonePos ] && [ "$direction" = 'LEFT' ]; then
        is_already_facing_left_target=1
    fi
    is_already_facing_right_target=0
    if [ $target -gt $clonePos ] && [ "$direction" = 'RIGHT' ]; then
        is_already_facing_right_target=1
    fi

    # echo "WAIT" # action: WAIT or BLOCK
    if [ $is_already_facing_left_target -eq 1 ] || [ $is_already_facing_right_target -eq 1 ] || [ $target -eq $clonePos ]; then
        echo 'WAIT'
    else
        echo 'BLOCK'
    fi
done
