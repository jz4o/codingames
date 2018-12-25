# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r n
cards=()
for (( i=0; i<$n; i++ )); do
  read -r card
  cards+=( "$card" )
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

results=()
for (( i=0; i<$n; i++ )); do
  card=`echo "${cards[$i]}" | tr -d ' '`

  sum_numbers=0
  for (( number_index=0; number_index<${#card}; number_index++ )); do
    number=${card:$number_index:1}

    if [ $(( $number_index % 2 )) -eq 0 ]; then
      number=$(( $number * 2 ))
      if [ $number -ge 10 ]; then
        number=$(( $number - 9 ))
      fi
    fi

    sum_numbers=$(( $sum_numbers + $number ))
  done

  if [ $(( $sum_numbers % 10 )) -eq 0 ]; then
    results+=( "YES" )
  else
    results+=( "NO" )
  fi
done

# echo "YES or NO"

for result in ${results[*]}; do
  echo $result
done

