# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# n: the number of relationships of influence
read -r n
declare -A relation_map=()
for (( i=0; i<$n; i++ )); do
    # x: a relationship of influence between two people (x influences y)
    read -r x y
    relation_map[$x]="${relation_map[$x]} $y"
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

deep_level=0
targets=("${!relation_map[@]}")
while [ ${#targets[@]} -gt 0 ]; do
    let deep_level++

    targets_tmp=()
    for target in ${targets[@]}; do
        targets_tmp=("${targets_tmp[@]}" "${relation_map[$target]}")
    done
    targets=(${targets_tmp[@]})
done

# The number of people involved in the longest succession of influences
# echo "2"
echo $deep_level
