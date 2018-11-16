# The while loop represents the game.
# Each iteration represents a turn of the game
# where you are given inputs (the heights of the mountains)
# and where you have to print an output (the index of the mountain to fire on)
# The inputs you are given are automatically updated according to your last actions.


# game loop
while true; do
  targetH=0
  targetId=0

  for (( i=0; i<8; i++ )); do
    # mountainH: represents the height of one mountain.
    read -r mountainH

    if [ $targetH -lt $mountainH ]; then
      targetH=$mountainH
      targetId=$i
    fi
  done

  # Write an action using echo
  # To debug: echo "Debug messages..." >&2

  # echo "4" # The index of the mountain to fire on.

  echo $targetId
done

