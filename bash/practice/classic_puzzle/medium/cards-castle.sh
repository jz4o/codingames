# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r H
map=""
for (( i=0; i<$H; i++ )); do
    read -r S
    map="$map$S"
done

# Write an action using echo
# To debug: echo "Debug messages..." >&2

left_part='/'
right_part='\'
empty_part='.'

width=$(( $H * 2 ))

is_stable=1
for (( h=0; h<$H; h++ )); do
    if [ $h -eq $(( $H - 1 )) ]; then
        is_bottom_row=1
    else
        is_bottom_row=0
    fi

    for (( w=0; w<$width; w++ )); do
        index=$(( $h * $width + $w ))
        card="${map:$index:1}"

        if [ "$card" = "$empty_part" ]; then
            continue
        fi

        if [ "$card" = "$right_part" ]; then
            side_card="${map:$(( $index - 1 )):1}"
            partner_part="$left_part"
        else
            side_card="${map:$(( $index + 1 )):1}"
            partner_part="$right_part"
        fi

        if [ "$side_card" = "$partner_part" ]; then
            check_side_card=1
        else
            check_side_card=0
        fi

        if [ $is_bottom_row -eq 1 ] || [ ${map:$(( $index + $width )):1} = "$partner_part" ]; then
            check_under_card=1
        else
            check_under_card=0
        fi

        if [ $check_side_card -eq 0 ] || [ $check_under_card -eq 0 ]; then
            is_stable=0
        fi
    done
done

# echo "UNSTABLE"
if [ $is_stable -eq 1 ]; then
    echo "STABLE"
else
    echo "UNSTABLE"
fi
