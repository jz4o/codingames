# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# n: the number of temperatures to analyse
read -r n
read -r -a myArray
for (( i=0; i<$n; i++ )); do
  # t: a temperature expressed as an integer ranging from -273 to 5526
  t=${myArray[$((i))]}

  if [ $t -lt 0 ] && [ $t -ge ${closest_zero_negative:--273} ]; then
    # it is a negative number closest to zero so far.
    closest_zero_negative=$t
  elif [ $t -gt 0 ] && [ $t -le ${closest_zero_positive:-5526} ]; then
    # it is a positive number closest to zero so far.
    closest_zero_positive=$t
  elif [ $t -eq 0 ]; then
    closest_zero_negative=0
    closest_zero_positive=0
  fi
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# echo "result"

np_balance=$(( ${closest_zero_negative:-0} + ${closest_zero_positive:-0} ))
if [ $n -eq 0 ]; then
  # no temperature.
  echo 0
elif [ -z "$closest_zero_positive" ] || [ -z "$closest_zero_negative" ]; then
  # only positive or negative.
  echo $closest_zero_positive$closest_zero_negative
elif [ $np_balance -le 0 ]; then
  # closest to zero is positive number.
  # or positive number and negative number equally close to zero.
  echo $closest_zero_positive
elif [ $np_balance -gt 0 ]; then
  # closest to zero is negative number.
  echo $closest_zero_negative
fi

