# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

initial_array=()
for (( i=1; i<=$N; i++ )); do
    initial_array=("${initial_array[@]}" "$i")
done
array=(${initial_array[@]})

center_index=$(( $N / 2 ))
front_size=$center_index
back_size=$(( $N - $center_index ))

progress_log=()
for (( i=0; i<$N; i++ )); do
    temp=""
    for (( j=0; j<$back_size; j++ )); do
        if [ $j -lt $back_size ]; then
            temp="${temp},${array[$(( ${#array[@]} - $j - 1 ))]}"
        fi

        if [ $j -lt $front_size ]; then
            temp="${temp},${array[$j]}"
        fi
    done

    progress_log=("${progress_log[@]}" "${temp:1}")
    array=(${temp//,/ })
done

# echo "IMPOSSIBLE"
if [ "${array[*]}" = "${initial_array[*]}" ]; then
    for log in "${progress_log[@]}"; do
        echo "$log"
    done
else
    echo "IMPOSSIBLE"
fi
