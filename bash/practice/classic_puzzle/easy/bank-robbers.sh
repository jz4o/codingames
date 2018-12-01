# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r R
read -r V

robbers=()
for (( i=0; i<$R; i++)); do
  robbers+=( 0 )
done

for (( i=0; i<$V; i++ )); do
  read -r C N

  vault_time=$(( (10 ** $N) * (5 ** ($C - $N)) ))

  min_total_time_robber_index=0
  min_total_time=${robbers[0]}
  for (( j=1; j<$R; j++ ));do
    if [ ${robbers[$j]} -lt $min_total_time ]; then
      min_total_time_robber_index=$j
      min_total_time=${robbers[$j]}
    fi
  done

  robbers[$min_total_time_robber_index]=$(( $min_total_time + $vault_time ))
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# echo "1"

max_total_time=0
for total_time in ${robbers[*]}; do
  if [ $total_time -gt $max_total_time ]; then
    max_total_time=$total_time
  fi
done

echo $max_total_time

