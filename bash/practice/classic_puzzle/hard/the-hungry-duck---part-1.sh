# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r W H
map=()
for (( i=0; i<$H; i++ )); do
    read -r -a myArray
    for (( j=0; j<$W; j++ )); do
        food=${myArray[$((j))]}

        map[$(( ($i + 1) * ($W + 1) + $j + 1 ))]=$food
    done
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

for (( h=1; h<=$H; h++ )); do
    for (( w=1; w<=$W; w++ )); do
        top=${map[$(( ($h - 1) * ($W + 1) + $w))]:-0}
        left=${map[$(( $h * ($W + 1) + $w - 1 ))]:-0}

        let map[$(( $h * ($W + 1)  + $w))]+=$(( top < left ? left : top ))
    done
done

# echo "answer"
echo ${map[$(( ($H + 1) * ($W + 1) - 1 ))]}
