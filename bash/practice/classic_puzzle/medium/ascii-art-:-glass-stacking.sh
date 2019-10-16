# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N

# Write an action using echo
# To debug: echo "Debug messages..." >&2

stage=0
while [ $N -ge $(( $stage + 1 )) ]; do
    let stage++
    let N-=$stage
done

glass_parts=(' *** ' ' * * ' ' * * ' '*****')
width=$(( $stage * ${#glass_parts[0]} + $(( $stage - 1 )) ))

results=()
for (( step=1; step<=$stage; step++ )); do
    for glass_part in "${glass_parts[@]}"; do
        parts_part="$glass_part"
        for (( i=2; i<=$step; i++ )); do
            parts_part="$parts_part $glass_part"
        done

        space_part_size=$(( ($width - ${#parts_part}) / 2 ))
        space_part="$(printf %${space_part_size}s)"
        parts_part="$space_part$parts_part$space_part"

        results=("${results[@]}" "$parts_part")
    done
done

# echo "answer"
for result in "${results[@]}"; do
    echo "$result"
done
