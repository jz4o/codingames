# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
IFS= read -r MESSAGE

# Write an action using echo
# To debug: echo "Debug messages..." >&2

function decode {
    arg1="$1"
    result=''

    turn=1
    sum=$turn
    while [ $sum -lt ${#arg1} ]; do
        let turn++
        let sum+=$turn
    done

    let sum-=$turn
    while [ $turn -gt 0 ]; do
        slice_size=$(( ${#arg1} - $sum ))
        if [ $(( $turn % 2 )) -eq 1 ] ; then
            # slice from right
            result="${arg1:$(( ${#arg1} - $slice_size ))}$result"
            arg1="${arg1:0:$(( ${#arg1} - $slice_size ))}"
        else
            # slice from left
            result="${arg1:0:$slice_size}$result"
            arg1="${arg1:$slice_size}"
        fi

        let turn--
        let sum-=$turn
    done

    echo "$result"
}

function encode {
    arg1="$1"
    target=""
    result=""

    turn=1
    while [ ${#arg1} -gt 0 ]; do
        # slice from left
        if [ $turn -ge ${#arg1} ]; then
            turn_is_over_text_length=1
            slice_size=${#arg1}
        else
            turn_is_over_text_length=0
            slice_size=$turn
        fi

        target=${arg1:0:$slice_size}
        if [ $turn_is_over_text_length -eq 1 ]; then
            arg1=''
        else
            arg1=${arg1:$turn}
        fi

        # insert into left or right.
        if [ $(( $turn % 2 )) -eq 1 ]; then
            result="$result$target"
        else
            result="$target$result"
        fi

        let turn++
    done

    echo "$result"
}

# choice the function for execution
if [ $N -gt 0 ]; then
    func="decode"
else
    func="encode"
fi

# execute function
for (( i=0; i<${N/-/}; i++ )); do
    MESSAGE=`"$func" "$MESSAGE"`
done

# echo "answer"
echo "$MESSAGE"
