# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r M
read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

if [ $M -gt $N ]; then
    short_distance=$(( $N - 1 ))
    long_distance=$(( $M - 1 ))
else
    short_distance=$(( $M - 1 ))
    long_distance=$(( $N - 1 ))
fi

# one way city
if [ $short_distance -le 0 ]; then
    echo 1
    exit
fi

mole_combination_expr="1"
for (( i=$(( $long_distance + 1 )); i<=$(( $short_distance + $long_distance )); i++ )); do
    mole_combination_expr="$mole_combination_expr * $i"
done
mole_combination=`echo "$mole_combination_expr" | bc`

deno_combination_expr="1"
for (( i=1; i<=$short_distance; i++ )); do
    deno_combination_expr="$deno_combination_expr * $i"
done
deno_combination=`echo "$deno_combination_expr" | bc`

movable_combination=`echo "$mole_combination / $deno_combination" | bc`
significant_digits=`echo $movable_combination | tr -d '\\\' | tr -d ' '`

# echo "answer"
echo ${significant_digits:0:1000}
