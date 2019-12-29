# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r SIZE
read -r N
names=()
declare -A name_indexes_from_last=()
for (( i=0; i<$N; i++ )); do
    read -r name
    names=("${names[@]}" "$name")
    name_indexes_from_last[$name]=$(( $N - $i ))
done
read -r T
throw_datas=()
for (( i=0; i<$T; i++ )); do
    read -r throwName throwX throwY
    throw_datas=("${throw_datas[@]}" "$throwName $throwX $throwY")
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

half_size=$(( $SIZE / 2 ))
declare -A score_board=()
for name in "${names[@]}"; do
    score_board[$name]=0
done

for throw_data in "${throw_datas[@]}"; do
    throw_data_elements=($throw_data)
    name=${throw_data_elements[0]}
    x=${throw_data_elements[1]}
    y=${throw_data_elements[2]}

    distance_with_center=`echo "sqrt( $x ^ 2 + $y ^ 2 )" | bc`
    if [[ ! "$distance_with_center" =~ '.0+$' ]]; then
        distance_with_center=`echo "${distance_with_center}" | grep -o -E '^[0-9]+'`
        let distance_with_center++
    fi
    distance_with_edge=`echo "sqrt(($half_size - ${x/-}) ^ 2 + ($half_size - ${y/-}) ^ 2)" | bc`
    if [[ ! "$distance_with_edge" =~ '.0+$' ]]; then
        distance_with_edge=`echo "${distance_with_edge}" | grep -o -E '^[0-9]+'`
        let distance_with_edge++
    fi

    in_square_horizontal_flag=0
    if [ $x -ge $(( $half_size * -1 )) ] && [ $x -le $half_size ]; then
        in_square_horizontal_flag=1
    fi
    in_square_vertical_flag=0
    if [ $y -ge $(( $half_size * -1 )) ] && [ $y -le $half_size ]; then
        in_square_vertical_flag=1
    fi

    in_square_flag=0
    if [ $in_square_horizontal_flag -eq 1 ] && [ $in_square_vertical_flag -eq 1 ]; then
        in_square_flag=1
    fi
    in_circle_flag=0
    if [ $distance_with_center -le $half_size ]; then
        in_circle_flag=1
    fi
    in_diamond_flag=0
    if [ $distance_with_center -le $distance_with_edge ]; then
        in_diamond_flag=1
    fi

    if [ $in_diamond_flag -eq 1 ]; then
        let score_board[$name]+=15
    elif [ $in_circle_flag -eq 1 ]; then
        let score_board[$name]+=10
    elif [ $in_square_flag -eq 1 ]; then
        let score_board[$name]+=5
    fi
done

score_board_for_sort=()
for name in "${!score_board[@]}"; do
    score=`printf %03d ${score_board[$name]}`
    name_index=`printf %02d ${name_indexes_from_last[$name]}`

    score_board_for_sort=("${score_board_for_sort[@]}" "$score:$name_index:$name")
done
sorted_score_board=(`for v in "${score_board_for_sort[@]}"; do echo "$v"; done | sort -r`)

# echo "answer"
for score_line in "${sorted_score_board[@]}"; do
    score_elements=(${score_line//:/ })
    score=`echo "${score_elements[0]}" | sed s/^0//`
    name=${score_elements[2]}

    echo "$name $score"
done
