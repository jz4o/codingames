# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r start n

# Write an action using echo
# To debug: echo "Debug messages..." >&2

zero_string_size=4
one_string_size=3

for (( i=0; i<$n; i++ )); do
    binary=`echo "obase=2; $start" | bc`
    zeros_sum=$(( `echo "$binary" | grep -o '0' | wc -l` * $zero_string_size ))
    ones_sum=$((  `echo "$binary" | grep -o '1' | wc -l` * $one_string_size ))
    result=$(( $zeros_sum + $ones_sum ))

    if [ $start -eq $result ]; then
        break
    else
        start=$result
    fi
done

# echo "42"
echo "$start"
