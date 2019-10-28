# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r sequence

# Write an action using echo
# To debug: echo "Debug messages..." >&2

declare -A depths=()
depth=0

while [ ${#sequence} -gt 0 ]; do
    first_str=${sequence:0:1}
    sequence=${sequence:1}

    if [ "$first_str" = "-" ]; then
        first_str=${sequence:0:1}
        sequence=${sequence:1}

        depths[$first_str]="${depths[$first_str]:="1"}:$depth"
        let depth--
    else
        let depth++
    fi
done

for key in "${!depths[@]}"; do
    sum="0"
    digits=(${depths[$key]//:/ })
    for d in "${digits[@]}"; do
        if [ "$d" != "0" ]; then
           sum="$sum + (1 / $d)"
        fi
    done
    sum=`echo "scale=1; $sum" | bc`

    if [ `echo "${maximum_value:-0} < $sum" | bc` == 1 ]; then
        maximum_key="$key"
        maximum_value=$sum
    fi
done

# echo "answer"
echo "$maximum_key"
