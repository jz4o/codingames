# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

monthly_numbers=()
read -r N
for (( i=0; i<$N; i++ )); do
    read -r M
    monthly_numbers=("${monthly_numbers[@]}" "$M")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

declare -r MONTHS=('Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'Jul' 'Aug' 'Sep' 'Oct' 'Nov' 'Dec')

sum=0
for monthly_number in "${monthly_numbers[@]}"; do
    months=(`echo "$monthly_number" | grep -o -E '.{3}'`)
    for (( i=0; i<${#months[@]}; i++ )); do
        month="${months[$i]}"
        month_index=`echo "${MONTHS[@]}" | grep -o -E "^.*${month}" | grep -o ' ' | wc -l`

        let sum+=$(( $month_index * (${#MONTHS[@]} ** (${#months[@]} - 1 - $i)) ))
    done
done

result=''
while [ $sum -gt 0 ]; do
    month_index=$(( $sum % ${#MONTHS[@]} ))
    sum=$(( $sum / ${#MONTHS[@]} ))

    result="${MONTHS[$month_index]}$result"
done

# echo "answer"
echo "$result"
