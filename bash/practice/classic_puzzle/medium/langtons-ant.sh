# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r W H
read -r x y
read -r direction
read -r T
map=()
for (( i=0; i<$H; i++ )); do
    read -r C
    map=("${map[@]}" `echo "$C" | grep -o -E '.{1}'`)
done
directions=('N' 'E' 'S' 'W')
for (( i=0; i<${#directions[@]}; i++ )); do
    if [ "${directions[$i]}" = "$direction" ]; then
        direction_index=$i
    fi
done

for (( i=0; i<$T; i++ )); do

    # Write an action using echo
    # To debug: echo "Debug messages..." >&2

    map_index=$(( $y * $W + $x ))
    if [ "${map[$map_index]}" = '#' ]; then
        map[$map_index]='.'
        direction_index=$(( ($direction_index + 1) % ${#directions[@]} ))
    else
        map[$map_index]='#'
        direction_index=$(( ($direction_index + ${#directions[@]} - 1) % ${#directions[@]} ))
    fi

    case "${directions[$direction_index]}" in
        'N' ) let y--;;
        'E' ) let x++;;
        'W' ) let x--;;
        'S' ) let y++;;
    esac

    # echo "answer"
done

result="${map[@]}"
result="${result// /}"
echo $result | grep -o -E ".{$W}"
