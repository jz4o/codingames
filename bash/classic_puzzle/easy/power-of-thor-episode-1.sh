# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
# ---
# Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.

# lightX: the X position of the light of power
# lightY: the Y position of the light of power
# initialTX: Thor's starting X position
# initialTY: Thor's starting Y position
read -r lightX lightY initialTX initialTY

# game loop
while true; do
  # remainingTurns: The remaining amount of turns Thor can move. Do not remove this line.
  read -r remainingTurns

  # Write an action using echo
  # To debug: echo "Debug messages..." >&2

  # direction initialze
  move_x=''
  move_y=''

  # duguage X
  if [ $lightX -lt $initialTX ]; then
    move_x='W'
    initialTX=$(( $initialTX - 1 ))
  elif [ $lightX -gt $initialTX ]; then
    move_x='E'
    initialTX=$(( $initialTX + 1 ))
  fi

  # duguage Y
  if [ $lightY -lt $initialTY ]; then
    move_y='N'
    initialTY=$(( $initialTY - 1 ))
  elif [ $lightY -gt $initialTY ]; then
    move_y='S'
    initialTY=$(( $initialTY + 1 ))
  fi

  # A single line providing the move to be made: N NE E SE S SW W or NW
  # echo "SE"

  echo $move_y$move_x
done

