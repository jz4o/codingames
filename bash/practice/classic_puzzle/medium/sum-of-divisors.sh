# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# @n = gets.to_i
read -r n

# Write an action using echo
# To debug: echo "Debug messages..." >&2

expr=0
for (( i=1; i<=$n; i++ )); do
    let expr+=$(( ( $n / $i ) * $i ))
done

# echo "sum"
echo "$expr"
