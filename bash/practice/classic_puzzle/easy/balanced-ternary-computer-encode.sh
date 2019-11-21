# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# @dec = gets.to_i
read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

base_num=3

# convert decimal to 3 base number(reverse)
# NOTE: convert negative to positive for simplicity
n_by_base=`echo "obase=${base_num}; ibase=10; ${N//-/}" | bc | rev`

# convert 3 base number to balanced ternary
temp=()
for (( i=0; i<${#n_by_base}; i++ )); do
    temp[$i]=$(( ${temp[$i]:-0} + ${n_by_base:$i:1} ))
    target=${temp[$i]}

    # carry over
    if [ $target -ge $(( $base_num - 1 )) ]; then
        let temp[$i]-=$base_num

        next_index=$(( $i + 1 ))
        temp[$next_index]=$(( ${temp[$next_index]:-0} + 1 ))
    fi
done

# restore negative number
if [ $N -lt 0 ]; then
    for (( i=0; i<${#temp[@]}; i++ )); do
        temp[$i]=$(( ${temp[$i]} * -1 ))
    done
fi

# convert -1 to T
result=""
for t in "${temp[@]}"; do
    if [ $t -lt 0 ]; then
        result="${result}T"
    else
        result="${result}${t}"
    fi
done

# restore reverse digits
result=`echo "$result" | rev`

# echo "42"
echo "$result"
