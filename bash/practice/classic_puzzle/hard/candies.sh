# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r n k

# Write an action using echo
# To debug: echo "Debug messages..." >&2

resurts=()
temps=()
for ((i = 1; i <= $k; i++)) {
    temps=("${temps[@]}" $i)
}

last_index=$(( ${#temps[@]} - 1 ))
while [ $last_index -ge 0 ]; do
    # pop for temps
    temp=${temps[$last_index]}
    let last_index--

    sum=0
    for i in ${temp[@]}; do
        let sum+=$i
    done

    if [ $sum -eq $n ]; then
        results=( "${temp[@]}" "${results[@]}" )
    elif [ $sum -lt $n ]; then
        for ((i = 1; i <= $k; i++)) {
            # push to temps
            let last_index++
            temps[$last_index]="${temp[@]} $i"
        }
    fi
done

# echo "answer"
for result in "${results[@]}"; do
    echo "$result"
done
