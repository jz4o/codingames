# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r W
read -r H
grid=""
for (( i=0; i<$H; i++ )); do
    read -r ROW
    grid="$grid$ROW"
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

horizontal_empty_counts=()
vertical_empty_count=()
for (( h=0; h<$H; h++ )); do
    for (( w=0; w<$W; w++ )); do
        if [ ! "${grid:$(( $h * $W + $w )):1}" = '.' ]; then
            continue
        fi

        horizontal_empty_counts[$h]=$(( ${horizontal_empty_counts[$h]:-0} + 1 ))
        vertical_empty_counts[$w]=$(( ${vertical_empty_counts[$w]:-0} + 1 ))
    done
done

default_score=0
for count in `echo "${horizontal_empty_counts[@]} ${vertical_empty_counts[@]}"`; do
    if [ $count -eq 0 ]; then
        let default_score++
    fi
done

max_score=$default_score
for (( h=0; h<$H; h++ )); do
    for (( w=0; w<$W; w++ )); do
        # check block can placed?
        target_index=$(( $h * $W + $w ))
        if [ ! "${grid:$target_index:1}"                 = '.' ]; then continue; fi # target mass
        if [ ! "${grid:$(( $target_index + 1 )):1}"      = '.' ]; then continue; fi # right mass
        if [ ! "${grid:$(( $target_index + $W )):1}"     = '.' ]; then continue; fi # bottom mass
        if [ ! "${grid:$(( $target_index + $W + 1 )):1}" = '.' ]; then continue; fi # bottom right mass

        # count columns and rows that could be completed.
        score=0
        for (( check_h=0; check_h<$H; check_h++ )); do
            if [ $check_h -eq $h ] || [ $check_h -eq $(( $h + 1 )) ]; then
                expect_count=2
            else
                expect_count=0
            fi

            if [ ${horizontal_empty_counts[$check_h]} -eq $expect_count ]; then
                let score++
            fi
        done
        for (( check_w=0; check_w<$W; check_w++ )); do
            if [ $check_w -eq $w ] || [ $check_w -eq $(( $w + 1 )) ]; then
                expect_count=2
            else
                expect_count=0
            fi

            if [ ${vertical_empty_counts[$check_w]} -eq $expect_count ]; then
                let score++
            fi
        done

        if [ $score -gt $max_score ]; then
            max_score=$score
        fi
    done
done

# echo "answer"
echo $max_score
