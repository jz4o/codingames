# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r n
map=()
for (( i=0; i<$n; i++ )); do
    read -r -a myArray
    for (( j=0; j<$n; j++ )); do
        c=${myArray[$((j))]}
        map=("${map[@]}" "$c")
    done
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

# counter
all_sum=0
horizontal_line_sums=()
vertical_line_sums=()
left_top_to_right_bottom_sum=0
left_bottom_to_right_top_sum=0
for (( i=0; i<$n; i++ )); do
    horizontal_line_sums[$i]=0
    vertical_line_sums[$i]=0
done

# count
for (( i=0; i<$n; i++ )); do
    for (( j=0; j<$n; j++ )); do
        c=${map[$(( ($i * $n) + $j ))]}

        let all_sum+=$c
        let horizontal_line_sums[$i]+=$c
        let vertical_line_sums[$j]+=$c
        if [ $i == $j ];                  then let left_top_to_right_bottom_sum+=$c; fi
        if [ $(( $i + $j + 1 )) -eq $n ]; then let left_bottom_to_right_top_sum+=$c; fi
    done
done

# checker
expect_all_sum=0
for (( i=0; i<=$(( $n ** 2 )); i++ )); do
    let expect_all_sum+=$i
done
expect_line_sum=$(( $expect_all_sum / $n ))

# check
result=1
if [ $all_sum -ne $expect_all_sum ]; then result=0; fi
for sum in `echo "${horizontal_line_sums[@]} ${vertical_line_sums[@]} $left_top_to_right_bottom_sum $left_bottom_to_right_top_sum"`; do
    if [ $sum -ne $expect_line_sum ]; then
        result=0
    fi
done

# echo "answer"
if [ $result -eq 1 ]; then
    echo "MAGIC"
else
    echo "MUGGLE"
fi
