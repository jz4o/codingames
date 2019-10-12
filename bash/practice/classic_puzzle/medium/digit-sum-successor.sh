# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

digits=(0 $(echo $N | sed 's/\(.\)/\1 /g'))

# search decremental index
for (( i=$(( ${#digits[@]} - 1 )); i>=0; i-- )); do
    if [ ${digits[$i]} -ne 0 ]; then
        decrement_index=$i
        break
    fi
done
let digits[$decrement_index]--

# search incremental index
for (( i=$(( $decrement_index - 1 )); i>=0; i-- )); do
    if [ ${digits[$i]} -ne 9 ]; then
        increment_index=$i
        break
    fi
done
let digits[$increment_index]++

# sort
result=""
for (( i=0; i<=$increment_index; i++ )); do
    result="$result${digits[$i]}"
done
sorted_digits=(`for (( i=$(( $increment_index + 1 )); i<${#digits[@]}; i++ )); do echo ${digits[$i]}; done | sort -n`)
for i in "${sorted_digits[@]}"; do
    result="$result$i"
done

# echo "11"
if [ ${result:0:1} -eq 0 ]; then
    echo "${result:1}"
else
    echo "$result"
fi
