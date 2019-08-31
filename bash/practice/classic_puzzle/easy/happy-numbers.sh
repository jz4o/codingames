# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
xs=()
for (( i=0; i<$N; i++ )); do
    read -r x
    xs=( ${xs[@]} $x )
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

readonly HAPPY_NUMBER=1
readonly HAPPY_FACE=":)"
readonly UNHAPPY_FACE=":("

results=()
for x in ${xs[@]}; do
    temp=$x
    exit_numbers=" $HAPPY_NUMBER "
    while [[ ! "$exit_numbers" =~ " $temp " ]]; do
        exit_numbers="$exit_numbers$temp "

        sum=0
        for (( index=0; index < ${#temp}; index++ )); do
            let sum+=$(( ${temp:$index:1} ** 2 ))
        done
        temp=$sum
    done

    if [ $temp -eq $HAPPY_NUMBER ]; then
        result_face=$HAPPY_FACE
    else
        result_face=$UNHAPPY_FACE
    fi

    results=( "${results[@]}" "$x $result_face" )
done

# echo "23 :)"
for result in "${results[@]}"; do
    echo $result
done
