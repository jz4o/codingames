# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r n
read -r -a myArray
for (( i=0; i<$n; i++ )); do
    x=${myArray[$((i))]}
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

l_index=-1
r_index=${#myArray[*]}
turn=0
while [ $l_index -lt $r_index ]; do
    # next zero from left
    let l_index++
    while [ $l_index -lt ${#myArray[*]} ] && [ ${myArray[$l_index]} -ne 0 ]; do
        let l_index++
    done

    # next one from right
    let r_index--
    while [ $r_index -ge 0 ] && [ ${myArray[$(( $r_index ))]} -ne 1 ]; do
        let r_index--
    done

    let turn++
done

# echo "answer"
echo $(( $turn - 1 ))
