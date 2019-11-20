# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r a b c d
read -r n
instructions=()
for (( i=0; i<$n; i++ )); do
    read -r instruction
    instructions=("${instructions[@]}" "$instruction")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

index=0
while [ $index -lt ${#instructions[@]} ]; do
    instruction=(${instructions[$index]})
    operator="${instruction[0]}"
    arg1="${instruction[1]}"
    arg2="${instruction[2]}"
    arg3="${instruction[3]}"

    # convert positive and negative for substract by addition
    if [ "$operator" = "SUB" ]; then
        arg3="-$arg3"
    fi

    if [ "$operator" = "JNE" ]; then
        if [[ "$arg2" =~ [abcd] ]]; then
            arg2="\$${arg2}"
            arg2=`eval echo "$arg2"`
        fi
        if [[ "$arg3" =~ [abcd] ]]; then
            arg3="\$${arg3}"
            arg3=`eval echo "$arg3"`
        fi
        if [ $arg2 -ne $arg3 ]; then
            index=$arg1
            continue
        fi
    else
        eval "${arg1}=$(( "${arg2} + ${arg3:-0}" ))"
    fi

    let index++
done

# echo "a b c d"
echo "$a $b $c $d"
