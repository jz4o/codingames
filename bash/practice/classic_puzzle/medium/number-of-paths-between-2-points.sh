# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r M
read -r N
map=(`printf %0$(( $N + 1 ))d | tr '0' '1' | grep -o -E '.'`)
for (( i=0; i<$M; i++ )); do
    read -r ROW
    map=("${map[@]}" "1" `echo "$ROW" | grep -o -E '.'`)
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

path_map=()
map[$(( $N + 2 ))]=1
path_map[$(( $N + 2 ))]=1
for (( h=1; h<=$M; h++ )); do
    for (( w=1; w<=$N; w++ )); do
        index=$(( ($N + 1) * $h + $w ))
        if [ ${map[$index]} -ne 0 ]; then
            continue
        fi

        top_math_paths=${path_map[$(( $index - ($N + 1) ))]:-0}
        left_math_paths=${path_map[$(( $index - 1 ))]:-0}
        path_map[$index]=$(( $top_math_paths + $left_math_paths ))
    done
done

# echo "answer"
echo "${path_map[-1]}"
