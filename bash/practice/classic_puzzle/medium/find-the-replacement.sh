# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r X
read -r Y

# Write an action using echo
# To debug: echo "Debug messages..." >&2

replace_from=""
replace_to=""
for (( i=0; i<${#X}; i++ )); do
    if [ "${X:$i:1}" != "${Y:$i:1}" ] && [[ ! "$replace_from" =~ "${X:$i:1}" ]]; then
        replace_from="$replace_from${X:$i:1}"
        replace_to="$replace_to${Y:$i:1}"
    fi
done
replaced=`echo "$X" | tr "$replace_from" "$replace_to"`

results=()
if [ "$X" = "$Y" ]; then
    results=("NONE")
elif [ "$replaced" = "$Y" ]; then
    for (( i=0; i<${#replace_from}; i++ )); do
        results=("${results[@]}" "${replace_from:$i:1}->${replace_to:$i:1}")
    done
else
    results=("CAN'T")
fi

# echo "anwser"
for result in "${results[@]}"; do
    echo "$result"
done
