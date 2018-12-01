# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r ROUNDS
read -r CASH
plays=()
for (( i=0; i<$ROUNDS; i++ )); do
  read -r PLAY
  plays+=( "$PLAY" )
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

for (( i=0; i<$ROUNDS; i++ )); do
  # betting
  bet=$(( $CASH / 4 ))
  if [ $(( $CASH % 4 )) -ne 0 ]; then
    bet=$(( $bet + 1 ))
  fi
  CASH=$(( $CASH - $bet ))

  # call
  read -r ball call number <<< ${plays[$i]}

  # pay
  if [ "$call" == "PLAIN" ] && [ $ball -eq $number ]; then
    CASH=$(( $CASH + ($bet * 36) ))
  elif [ "$call" == "ODD" ] && [ $(( $ball % 2 )) -ne 0 ]; then
    CASH=$(( $CASH + ($bet * 2) ))
  elif [ "$call" == "EVEN" ] && [ $(( $ball % 2 )) -eq 0 ] && [ $ball -gt 0 ]; then
    CASH=$(( $CASH + ($bet * 2) ))
  fi
done

# echo "cash of the target after playing"

echo $CASH

