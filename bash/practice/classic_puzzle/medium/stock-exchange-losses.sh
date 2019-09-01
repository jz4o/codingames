# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r n
read -r -a myArray

# Write an action using echo
# To debug: echo "Debug messages..." >&2

max_diff=0
min_value=$(( 2 ** 31 ))
for (( index = $(( ${#myArray[*]} - 1 )); $index > 0; index-- )); do
    min_candidate=${myArray[$(($index))]}
    if [ $min_candidate -lt $min_value ]; then
        min_value=$min_candidate
    fi

    diff=$(( $min_value - ${myArray[$(( $index - 1 ))]} ))
    if [ $max_diff -gt $diff ]; then
        max_diff=$diff
    fi
done

# echo "answer"
echo $max_diff
