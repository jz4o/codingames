# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
pis=()
for (( i=0; i<$N; i++ )); do
  read -r Pi
  pis+=( $Pi )
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# echo "answer"

IFS=$'\n'
pis=(`echo "${pis[*]}" | sort -n`)

min_diff=$(( 10000000 - 0 ))
for ((index=0; index < $N - 1; index++)); do
  pi=${pis[$index]}
  next_pi=${pis[$(( $index + 1 ))]}
  diff=$(( $next_pi - $pi ))

  if [ $diff -lt $min_diff ]; then
    min_diff=$diff
  fi
done

echo $min_diff

