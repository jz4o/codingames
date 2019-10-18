# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r W H
map=""
for (( i=0; i<$H; i++ )); do
    read -r line
    map="$map  $line"
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

elements_size=$(( ($W / 3 + 1) * 2 ))

# change two to one for size of between bar and bar
adjusted_map=""
for (( i=0; i<$H; i++ )); do
    for (( j=0; j<$(( $elements_size / 2 )); j++ )); do
        adjusted_map="$adjusted_map${map:$(( ($W + 2) * $i + $j * 3 )):1}"
        adjusted_map="$adjusted_map${map:$(( ($W + 2) * $i + $j * 3 + 2 )):1}"
    done
done

# create array from top and bottom labels
top_str="${adjusted_map:0:$elements_size}"
top=()
for (( i=1; i<${#top_str}; i+=2 )); do
    top=("${top[@]}" "${top_str:$i:1}")
done
bottom_str="${adjusted_map:$(( ${#adjusted_map} - $elements_size))}"
bottom=()
for (( i=1; i<${#bottom_str}; i+=2 )); do
    bottom=("${bottom[@]}" "${bottom_str:$i:1}")
done

# trace line
for (( i=${#adjusted_map}; i>0; i-- )); do
    if [ "${adjusted_map:$i:1}" = "-" ]; then
        change_right_index=$(( $i % $elements_size / 2 ))
        change_left_index=$(( $change_right_index - 1 ))

        tmp="${bottom[$change_right_index]}"
        bottom[$change_right_index]="${bottom[$change_left_index]}"
        bottom[$change_left_index]="$tmp"
    fi
done

# echo "answer"
for (( i=0; i<${#top[@]}; i++ ));do
    echo "${top[$i]}${bottom[$i]}"
done
