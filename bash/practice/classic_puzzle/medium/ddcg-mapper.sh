# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r L
read -r N
patterns=()
tempos=()
for (( i=0; i<$N; i++ )); do
    read -r pattern tempo

    patterns=("${patterns[@]}" `echo "$pattern" | tr 'X' '1'`)
    tempos=("${tempos[@]}" "$tempo")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

results=()
for (( l=$L; l>0; l-- )); do
    result=0
    for (( ti=0; ti<${#tempos[@]}; ti++ )); do
        if [ $(( $l % ${tempos[$ti]} )) -eq 0 ]; then
            result=$(( $result | 2#${patterns[$ti]} ))
        fi
    done

    result=$( printf '%04d' `echo "obase=2; $result" | bc` | tr '1' 'X' )
    results=("${results[@]}" "$result")
done

# echo "answer"
for result in "${results[@]}"; do
    echo "$result"
done
