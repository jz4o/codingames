# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
read -r C
budges=()
for (( i=0; i<$N; i++ )); do
    read -r B
    budges=(${budges[@]} $B)
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

budges_sum=0
for budge in ${budges[@]}; do
    let budges_sum+=$budge
done

if [ $budges_sum -lt $C ]; then
    echo "IMPOSSIBLE"
    exit
fi

lack=$C
budges=(`for v in "${budges[@]}"; do echo "$v"; done | sort -n`)
results=()

for (( i=0; i<${#budges[@]}; i++ )); do
    average=$(( $lack / (${#budges[@]} - $i) ))
    budge=${budges[$i]}
    if [ $budge -lt $average ]; then
        pay=$budge
    else
        pay=$average
    fi
    let lack-=$pay
    results=(${results[@]} $pay)
done

# echo "IMPOSSIBLE"
for result in ${results[@]}; do
    echo $result
done
