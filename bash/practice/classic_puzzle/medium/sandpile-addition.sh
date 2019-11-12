# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

num1=""
num2=""
read -r n
for (( i=0; i<$n; i++ )); do
    read -r row
    num1="$num1$row"
done
for (( i=0; i<$n; i++ )); do
    read -r row
    num2="$num2$row"
done
num=()
for (( i=0; i<$(( $n ** 2 )); i++ )); do
    num=("${num[@]}" $(( ${num1:$i:1} + ${num2:$i:1} )) )
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

border=4
finish_flag=0
while [ $finish_flag -eq 0 ]; do
    finish_flag=1

    for (( row=0; row<$n; row++ )); do
        for (( column=0; column<$n; column++ )); do
            index=$(( $row * $n + $column ))

            if [ ${num[$index]} -lt $border ]; then continue; fi
            finish_flag=0

            let num[$index]-=$border
            if [ $row               -ne 0 ];  then let num[$(( $index - $n ))]++; fi # above
            if [ $(( $row + 1 ))    -ne $n ]; then let num[$(( $index + $n ))]++; fi # below
            if [ $column            -ne 0 ];  then let num[$(( $index - 1 ))]++;  fi # left
            if [ $(( $column + 1 )) -ne $n ]; then let num[$(( $index + 1 ))]++;  fi # right
        done
    done
done

# echo "answer"
result=`echo "${num[@]}" | tr -d " "`
for (( i=0; i<$n; i++ )); do
    index=$(($i * $n))
    echo "${result:$index:$n}"
done
