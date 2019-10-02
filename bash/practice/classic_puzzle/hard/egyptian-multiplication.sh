# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r a b

# Write an action using echo
# To debug: echo "Debug messages..." >&2

if [ $a -gt $b ]; then
    high=$a
    low=$b
else
    high=$b
    low=$a
fi

results=()

# initial formula
results=("${results[@]}" "$high * $low")

add_num_formula=''
while [ $low -ne 0 ]; do
    if [ $(( $low % 2 )) -eq 0 ]; then
        high=$(( $high * 2 ))
        low=$(( $low / 2 ))
    else
        add_num_formula="$add_num_formula + $high"
        let low--
    fi

    # way formula
    results=("${results[@]}" "= $high * $low$add_num_formula")
done

# answer
results=("${results[@]}" "= $(( $a * $b ))")

# echo "answer"
for result in "${results[@]}"; do
    echo "$result"
done
