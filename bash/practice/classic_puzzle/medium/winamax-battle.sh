# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

declare -r CARD_LANKS=(2 3 4 5 6 7 8 9 10 J Q K A)

# n: the number of cards for player 1
deck1=()
read -r n
for (( i=0; i<$n; i++ )); do
    # cardp1: the n cards of player 1
    read -r cardp1
    card="${cardp1:0:$(( ${#cardp1} - 1 ))}"
    card_lank=`echo "${CARD_LANKS[@]}" | grep -o -E ".*${card}" | grep -o -E ' ' | wc -l`
    deck1=("${deck1[@]}" "$card_lank")
done
# m: the number of cards for player 2
deck2=()
read -r m
for (( i=0; i<$m; i++ )); do
    # cardp2: the m cards of player 2
    read -r cardp2
    card="${cardp2:0:$(( ${#cardp2} - 1 ))}"
    card_lank=`echo "${CARD_LANKS[@]}" | grep -o -E ".*${card}" | grep -o -E ' ' | wc -l`
    deck2=("${deck2[@]}" "$card_lank")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

fight() {
    arg_deck1=(`echo ${1//:/ }`)
    arg_deck2=(`echo ${2//:/ }`)
    index=$3
    index=${index:-0}

    if [ "${arg_deck1[$index]}" = "" ] || [ "${arg_deck2[$index]}" = "" ]; then
        echo "ERROR"
        exit
    fi

    if [ ${arg_deck1[$index]} -eq ${arg_deck2[$index]} ]; then
        arg_deck1="${arg_deck1[@]}"
        arg_deck2="${arg_deck2[@]}"
        echo `fight "${arg_deck1// /:}" "${arg_deck2// /:}" $(( $index + 4 ))`
    elif [ ${arg_deck1[$index]} -gt ${arg_deck2[$index]} ]; then
        echo "1 $index"
    else
        echo "2 $index"
    fi
}

is_error=0
turn=0
while [ ${#deck1[@]} -gt 0 ] && [ ${#deck2[@]} -gt 0 ]; do
    let turn++

    arg_deck1="${deck1[@]}"
    arg_deck2="${deck2[@]}"
    result=`fight "${arg_deck1// /:}" "${arg_deck2// /:}"`
    if [ "$result" = "ERROR" ]; then
        is_error=1
        break
    fi
    result_win_deck="${result:0:1}"
    result_index=$(( "${result:2}" + 1 ))

    if [ "$result_win_deck" = 1 ]; then
        deck1=("${deck1[@]:$result_index}" "${deck1[@]:0:$result_index}" "${deck2[@]:0:$result_index}")
        deck2=("${deck2[@]:$result_index}")
    else
        deck2=("${deck2[@]:$result_index}" "${deck1[@]:0:$result_index}" "${deck2[@]:0:$result_index}")
        deck1=("${deck1[@]:$result_index}")
    fi
done

# echo "PAT"
if [ $is_error -eq 0 ]; then
    if [ ${#deck1[@]} -eq 0 ]; then
        echo "2 $turn"
    else
        echo "1 $turn"
    fi
else
    echo "PAT"
fi
