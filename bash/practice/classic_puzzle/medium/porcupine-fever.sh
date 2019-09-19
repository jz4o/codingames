# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r N
read -r Y
cages=()
for (( i=0; i<$N; i++ )); do
    read -r S H A
    cages=("${cages[@]}" $S $H $A)
done

STATE_COUNT=3
SURVIVAL=2

for (( i=0; i<$Y; i++ )); do

    # Write an action using echo
    # To debug: echo "Debug messages..." >&2

    alive=0
    for (( cage=0; cage<$(( ${#cages[@]} / $STATE_COUNT )); cage++ )); do
        sick=$(( ${cages[$(( $cage * $STATE_COUNT ))]} * ( 2 ** $i ) ))
        let cages[$(( $cage * $STATE_COUNT + $SURVIVAL ))]-=$sick
        survival=${cages[$(( $cage * $STATE_COUNT + $SURVIVAL ))]}
        if [ $survival -gt 0 ]; then
            let alive+=$survival
        fi
    done

    # echo "answer"
    echo $alive

    if [ $alive -le 0 ]; then
        break
    fi
done
