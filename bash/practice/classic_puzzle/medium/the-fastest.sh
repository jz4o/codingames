# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
results=()
for (( i=0; i<$N; i++ )); do
    read -r t
    results+=( $t )
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

IFS=$'\n'
result=(`echo "${results[*]}" | sort`)

# echo "answer"
echo "${result[0]}"
