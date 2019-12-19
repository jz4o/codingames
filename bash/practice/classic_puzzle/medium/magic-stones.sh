# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
read -r -a myArray
stones=()
for (( i=0; i<$N; i++ )); do
    level=${myArray[$((i))]}
    stones=("${stones[@]}" "$level")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

stone_count=0
levels=(`for v in "${stones[@]}"; do echo "$v"; done | sort -n | uniq`)
level_index=0
while [ ! "${levels[$level_index]}" = "" ]; do
    level="${levels[$level_index]}"

    target_stone_count=`echo " ${stones[@]} " | sed 's/ /  /g' | grep -o " ${level} " | wc -l`
    next_level_stone_count=$(( $target_stone_count / 2 ))
    target_stone_count=$(( $target_stone_count % 2 ))

    stones=(`echo " ${stones[@]} " | sed "s/ $level / /g"`)

    if [ $next_level_stone_count -ne 0 ]; then
        next_level=$(( $level + 1 ))
        for (( i=0; i<$next_level_stone_count; i++ )); do
            stones=("${stones[@]}" "$next_level")
        done

        levels=("${levels[@]}" "$next_level")
        levels=(`for v in "${levels[@]}"; do echo "$v"; done | sort -n | uniq`)
    fi

    let stone_count+=$target_stone_count
    let level_index++
done

# echo "1"
echo "$stone_count"
